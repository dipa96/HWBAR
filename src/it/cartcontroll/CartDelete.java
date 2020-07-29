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
import it.util.connessionedb;
/**
 * Servlet implementation class CartDelete
 */
@WebServlet("/CartDelete")
public class CartDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int idprodotto = Integer.parseInt(request.getParameter("idprodotto"));
		 int idcart = Integer.parseInt(request.getParameter("idcart"));
		 String pagepoint= request.getParameter("pgpoint");
		 int cacca = 0;
		 if(pagepoint.equals("0")) {
			 cacca = 0;
		 }else if (pagepoint.equals("10")) {
			 cacca =1;
		 }
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
		         if (cacca== 0) {
			         RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
		             dispatcher.include(request, response);
		             response.sendRedirect(url+"#myModal2");
			         }else if (cacca== 1) {
			             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
			             dispatcher.include(request, response);
			             request.getRequestDispatcher("/index.jsp").forward(request, response);
			         }
			}
			catch(Exception er) {}
	}

}
