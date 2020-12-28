<%@ page session="true"%>
<html>
   <head>
		
      <title>Start Web Application</title>
		<link type="text/css" href="styles/default.css" rel="stylesheet"></link>
   </head>
   <body onload=loadData("regioni");>

      <select id="regioni" onchange='loadData("province")'>
      	<option value="default">Scegli Regione
      
      </select>
      	
      <select id="province" onchange='loadData("comuni")'>
      	<option value="default">Scegli Provincia
      
      </select>
      
      <select id="comuni" onchange='cerca()'>
      	<option value="default">Scegli Comune
      
      </select>
      
      <br>
      
      <form method="get" action="https://www.google.com/search">
		<input id="cerca" name="q" size="31" value="" type="text">
		<button>Cerca</button>
		</form>
 
	<script type="text/javascript">
	
	document.getElementById("cerca").style.display = "none";
		
		function loadData(id)
		{
			var dropdown = document.getElementById(id);
			dropdown.selectedIndex = 0;
			
			if(id=='province'||id=='comuni')
				{
				 	clearDropdown(id);
					document.createElement(id).text = 'Scegli provincia';
					
				}

			var regione = document.getElementById('regioni').value;
			var provincia = document.getElementById('province').value;
			
			const src = 'db/'+ id + '.json';
		
			const request = new XMLHttpRequest();
			request.open('GET', src, true);
		
			request.onload = function() {
			  if (request.status === 200) {
			    const data = JSON.parse(request.responseText);
			    let option;
			    for (let i = 0; i < data.length; i++) {
			    	if(id=='regioni')
		    		{
				      option = document.createElement('option');
				      option.text = data[i].nome;
				      option.value = data[i].id;
				      dropdown.add(option);
		    		}
			    	else if(id=='province')
			    	{
			    		if(regione==data[i].id_regione)
			    			{
			    				option = document.createElement('option');
						      option.text = data[i].nome;
						      option.value = data[i].id;
						      dropdown.add(option);
			    			}
			    	}
			    	else if(id=='comuni')
			    	{
			    		if(provincia==data[i].id_provincia)
		    			{
		    				option = document.createElement('option');
					      option.text = data[i].nome;
					      option.value = data[i].nome;
					      dropdown.add(option);
		    			}
			    	}
			  
			   
			    }
			   } else {
			    // Reached the server, but it returned an error
			  }   
			}
		
			request.onerror = function() {
			  console.error('An error occurred fetching the JSON from ' + url);
			};
		
			request.send();
			
		}
		
		
		function clearDropdown(id)
		{
			var select = document.getElementById(id);
			var length = select.options.length;
			for (i = length-1; i >= 0; i--) {
			  select.options[i] = null;
				
			}
		}
		
		function cerca()
		{
			document.getElementById("cerca").value = document.getElementById('comuni').value;
		}

	</script>      

   </body>
</html>

