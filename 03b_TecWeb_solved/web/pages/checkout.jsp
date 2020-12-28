<!-- pagina per la gestione di errori -->
<%@ page errorPage="../errors/failure.jsp"%>

<!-- accesso alla sessione -->
<%@ page session="true"%>

<!-- import di classi Java -->
<%@ page import="it.unibo.tw.web.beans.Catalogue"%>
<%@ page import="it.unibo.tw.web.beans.Cart"%>
<%@ page import="it.unibo.tw.web.beans.Item"%>

<%!

double total(Cart cart) {
	double total = 0;
	for ( Item item : cart.getItems() ) {
		total += item.getPrice() * cart.getOrder(item);
	}
	return total;
}

%>




<html>
	<head>
		<meta name="Author" content="pisi79">
		<title>Checkout JSP</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/styles/default.css" type="text/css"/>
	</head>

	<body>	

		<%@ include file="../fragments/header.jsp" %>
		<%@ include file="../fragments/menu.jsp" %>
	
		<div id="main" class="clear">
			
			<jsp:useBean id="catalogue" class="it.unibo.tw.web.beans.Catalogue" scope="application" />
			<jsp:useBean id="cart" class="it.unibo.tw.web.beans.Cart" scope="session" />
			
			<%
			
			if ( request.getParameter("checkout") != null && request.getParameter("checkout").equals("ok") ) {
				cart.empty();
				
				Item[] cartItems = cart.getItems().toArray(new Item[0]);
				for(Item aCartItem:cartItems)
				{
					int quantita = aCartItem.getQuantity();
					aCartItem.setQuantity();
				}
				
				
				
				
				
				
				
				
				
			}
			
			
			%>
			
			
			<div id="left" style="float: left; width: 48%; border-right: 1px solid grey">
			
			<p>Cart content:</p>
				<table class="formdata">
					<tr>
						<th style="width: 33%">Description</th>
						<th style="width: 33%">Price</th>
						<th style="width: 33%">Your order</th>
					</tr>
					<% 
					Item[] cartItems = cart.getItems().toArray(new Item[0]);
					for( Item aCartItem : cartItems ){  
					%> 
						<tr>
							<td><%= aCartItem.getDescription() %></td>
							<td><%= aCartItem.getPrice() %> &#8364;</td>
							<td><%= cart.getOrder(aCartItem) %></td>
						</tr>
					<% 
					} 
					%>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>			
				<br/>
				<p>
				Total: <span style="font-size: x-large; color: red;"><%= total(cart) %> &#8364;</span>
				</p>
				
				<%
				if ( cart.getItems().size() > 0 ) {
				%>
					<br/>
					<a href="?empty=ok">Remove all items from the cart</a>
				<%
				}
				%>
							
			</div>
			
			<div id="right" style="float: right; width: 48%">
				
				<div>
				 
				 	
						<a href="?checkout=ok">Fai il checkout</a>
				 	
				 
				
				</div>
				
				
			</div>
			
			
			
		</div>
	
		<%@ include file="../fragments/footer.jsp" %>

	</body>
</html>
