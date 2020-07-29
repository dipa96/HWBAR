package it.profilecontroll;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.util.connessionedb;

/**
 * Servlet implementation class updatepassword
 */
@WebServlet("/updatepassword")
public class updatepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tempcheck= "";
		HttpSession session = request.getSession(true);
		Connection con;
		PreparedStatement ps;
		Statement st;
		PrintWriter out = response.getWriter();
		String password = request.getParameter("password");
		String rpassword = request.getParameter("rpassword");
		int id = Integer.parseInt(request.getParameter("id"));
		 if(session.getAttribute("id")!=null) {
		try {
			con = connessionedb.createConnection();
		if(!password.equals("") && !rpassword.equals("")) {
			if(password.equals(rpassword)) {
			String qpass ="UPDATE users SET password ='"+password+"' WHERE id ='"+id+"'";
			 st = con.createStatement();
			 st.executeUpdate(qpass);
	         con.close();
	         System.out.println("Profilo "+id+" aggiornato!");
	         request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-success\" role=\"alert\"> Password aggiornata con successo! </div>  </div>  ");
	        request.setAttribute("reload", "document.getElementById(\"access\").click();");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
            dispatcher.forward(request, response);
			}
			else  {		
				request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-danger\" role=\"alert\"> Attenzione, le password non combaciano! </div>  </div>  ");
				request.setAttribute("reload", "document.getElementById(\"access\").click();");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
	            dispatcher.forward(request, response);
			}
		}
		}
		catch(Exception er) {}}
	        else {
				request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		
	}

}
