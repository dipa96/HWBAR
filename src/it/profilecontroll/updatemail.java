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
 * Servlet implementation class updatemail
 */
@WebServlet("/updatemail")
public class updatemail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("mail");
		int id = Integer.parseInt(request.getParameter("id"));
		String tempcheck= "";
		HttpSession session = request.getSession(true);
		Connection con;
		PreparedStatement ps;
		Statement st;
		PrintWriter out = response.getWriter();
		if(session.getAttribute("id")!=null) {
		try {
			con = connessionedb.createConnection();
		if(!email.equals("")) {
			String checkquery = "SELECT * FROM users where email ='"+email+"';";
			int flag = 0;				
			ps = con.prepareStatement(checkquery);
			ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 tempcheck=rs.getString(2);
				 if(email.equals(tempcheck)) {
				 flag++;
				 }
			 }
			 if (flag < 1) {
				 String qmail ="UPDATE users SET email ='"+email+"' WHERE id ='"+id+"'";
				 st = con.createStatement();
				 st.executeUpdate(qmail);
				 session.setAttribute("user", email);
		         con.close();
				 System.out.println("Mail profilo "+id+" aggiornata!");
				 request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
		             		"	<div class=\"alert alert-success\" role=\"alert\"> Metodo di pagamento eliminato con successo! </div>  </div>  "); 
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
				 request.setAttribute("reload", "document.getElementById(\"access\").click();");
		            dispatcher.forward(request, response);
			 }
			 else {
				 request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
		             		"	<div class=\"alert alert-danger\" role=\"alert\"> Attenzione, la mail che hai inserito &egrave; gi&agrave; esistente! </div>  </div>  ");
				request.setAttribute("reload", "document.getElementById(\"access\").click();");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
	            dispatcher.forward(request, response);
				}
		}
		}
		catch(Exception er) {}
		}
        else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	}
		


