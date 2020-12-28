

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Register
 */

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
		Map<String,GruppoBean> gruppi = new HashMap<String,GruppoBean>();
		
		GruppoBean g = new GruppoBean();
		g.setNomeGruppo("g1");
		gruppi.put(g.getNomeGruppo(), g);
		
		g = new GruppoBean();
		g.setNomeGruppo("g2");
		gruppi.put(g.getNomeGruppo(), g);
		
		g = new GruppoBean();
		g.setNomeGruppo("g3");
		gruppi.put(g.getNomeGruppo(), g);
		
		this.getServletContext().setAttribute("gruppi", gruppi);
		
	}

    public Register() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String group = req.getParameter("group");
	
		Map<String,GruppoBean> gruppi = (Map<String, GruppoBean>) this.getServletContext().getAttribute("gruppi");
		GruppoBean g = gruppi.get(group);
		UtenteBean u = new UtenteBean();
		u.setGruppo(group);
		u.setNomeUtente(username);
		u.setPassword(password);
		
		HttpSession session = req.getSession();
	
		if(g==null)
		{
			session.setAttribute("err", "1");
			gruppi.put(g.getNomeGruppo(), g);
			this.getServletContext().setAttribute("gruppi", gruppi);
			RequestDispatcher rd = this.getServletContext().getRequestDispatcher("password.jsp");
			rd.forward(req, res);
			return;
		}
		
		if(!g.containsUser(u))
		{
			g.addUtente(u);
		}
		
		if(g.containsUser(u) && !g.getUtenteByName(u.getNomeUtente()).isValid())
		{
			UtenteBean ut = g.getUtenteByName(u.getNomeUtente());
			ut.setPassword(password);
			ut.setZero(new Date());
			ut.setValid(true);
			g.addUtente(ut);
		}
		
		gruppi.put(g.getNomeGruppo(), g);
		this.getServletContext().setAttribute("gruppi", gruppi);
		
		RequestDispatcher rd = this.getServletContext().getRequestDispatcher("password.jsp");
		rd.forward(req, res);
		return;
	
	
	
	
	
	
	
	
	}
	
}
