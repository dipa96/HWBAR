package it.admin;

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
 * Servlet implementation class SblockOrder
 */
@WebServlet("/SblockOrder")
public class SblockOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(true);//Fetch session object
		 int idcart = Integer.parseInt(request.getParameter("idch"));
		 String ruolo = (String)session.getAttribute("ruolo");
		 Connection con;
		 Statement st;
		 if(session.getAttribute("id")!=null || ruolo.equals("admin")) {
		 try {
				con = connessionedb.createConnection();
				 String dlt ="UPDATE ordini_user SET status = '1' WHERE id = '"+ idcart +"' ";
				 st = con.createStatement();
				 st.executeUpdate(dlt);
		         con.close();
	             request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-success\" role=\"alert\"> L'ordine è stato sbloccato con successo! </div>  </div>  "); 
	             request.setAttribute("reload", "document.getElementById(\"BlockOrd8\").click();");
	             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
		            dispatcher.forward(request, response);
			}
			catch(Exception er) {
				er.printStackTrace();
			}}
	        else {
				request.setAttribute("errorMessage", "Non è possibile sbloccare l'ordine!");
				request.getRequestDispatcher("/amministrazione/amministrazione.jsp").forward(request, response);
			}
	}

}
