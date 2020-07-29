package it.cartcontroll;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.util.connessionedb;

/**
 * Servlet implementation class CartdeleteDetails
 */
@WebServlet("/CartdeleteDetails")
public class CartdeleteDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int idprodotto = Integer.parseInt(request.getParameter("idprodotto"));
		 int idcart = Integer.parseInt(request.getParameter("idcart"));
		 String url = request.getHeader("referer");
		 Connection con;
		PreparedStatement ps;
		Statement st;
		 try {
				con = connessionedb.createConnection();
				 String dlt ="DELETE FROM ordini_prodotti WHERE ordini_user_id ='"+idcart+"' and prodotti_id='"+idprodotto+"';";
				 st = con.createStatement();
				 st.executeUpdate(dlt);
		         con.close();
		         RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
	             dispatcher.include(request, response);
	             request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
		             		"	<div class=\"alert alert-success\" role=\"alert\">Prodotto rimosso dal carrello. </div>  </div>  ");
	             request.getRequestDispatcher("/userarea/usercart.jsp").forward(request, response);
			}
			catch(Exception er) {}
	}

}
