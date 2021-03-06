package it.profilecontroll;

import java.io.IOException;
import java.sql.Connection;
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
 * Servlet implementation class DelAddress
 */
@WebServlet("/DelAddress")
public class DelAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(true);//Fetch session object
		 int id = (int)session.getAttribute("id");
		 int id_add = Integer.parseInt(request.getParameter("id_add"));
		 Connection con;
		 Statement st;
		 if(session.getAttribute("id")!=null) {
		 try {
				con = connessionedb.createConnection();
				 String dlt ="UPDATE indirizzo_sped SET status = '1' WHERE id = '"+id_add+"' AND users_id = '"+id+"' ; ";
				 st = con.createStatement();
				 st.executeUpdate(dlt);
		         con.close();
	             request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-success\" role=\"alert\"> Indirizzo di spedizione eliminato con successo! </div>  </div>  "); 
	             request.setAttribute("reload", "document.getElementById(\"address\").click();");
	             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
		            dispatcher.forward(request, response);
			}
			catch(Exception er) {
				er.printStackTrace();
			}}
	        else {
				request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
	}

}