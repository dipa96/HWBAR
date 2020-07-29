package it.cartcontroll;

import java.io.IOException;
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

import it.util.connessionedb;

/**
 * Servlet implementation class CartsetQnt
 */
@WebServlet("/CartsetQnt")
public class CartsetQnt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int idprodotto = Integer.parseInt(request.getParameter("idprodotto"));
		 int idcart = Integer.parseInt(request.getParameter("idcart"));
		 String pagepoint= request.getParameter("pgpoint");
		 int ca = 0;
		 if(pagepoint.equals("0")) {
			 ca = 0;
		 }else if (pagepoint.equals("10")) {
			 ca =1;
		 }
		 String url = request.getHeader("referer");
		 int qntfi =0;
		 int qnt = 0;
		 int qntp = 0;
		 Connection con;
		PreparedStatement ps;
		PreparedStatement ps1;
		Statement st;
		 try {
			 	String checkqnt = "SELECT deposito from prodotti WHERE id='"+idprodotto+"'";
				String checkquery ="SELECT * from ordini_prodotti WHERE ordini_user_id ='"+idcart+"'AND prodotti_id ='"+idprodotto+"'";
				con = connessionedb.createConnection();
				ps = con.prepareStatement(checkquery);
				ResultSet rs = ps.executeQuery();
				 if(rs.next()) {
					 qnt=rs.getInt(3);

				 }
				 qntfi = qnt + 1;
				 ps1 = con.prepareStatement(checkqnt);
				 ResultSet cs = ps1.executeQuery();
				 if(cs.next()) {
					 qntp=cs.getInt(1);
				 }
				 if (ca== 0) {
				 if (qntfi <= qntp) {
				 String dlt ="UPDATE ordini_prodotti SET qnt = '"+qntfi+"' WHERE ordini_user_id ='"+idcart+"' and prodotti_id='"+idprodotto+"';";
				 st = con.createStatement();
				 st.executeUpdate(dlt);
		         con.close();
		         RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
	             dispatcher.include(request, response);
	             response.sendRedirect(url+"#myModal2");
				 }else if(qntfi >= qntp){
					 response.sendRedirect(url+"#myModal2");
				 }
				 }else if (ca== 1) {
					 if (qntfi <= qntp) {
						 String dlt ="UPDATE ordini_prodotti SET qnt = '"+qntfi+"' WHERE ordini_user_id ='"+idcart+"' and prodotti_id='"+idprodotto+"';";
						 st = con.createStatement();
						 st.executeUpdate(dlt);
				         con.close();
				         RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
			             dispatcher.include(request, response);
			             request.setAttribute("pagepoint", "1");
			             request.getRequestDispatcher("/index.jsp").forward(request, response);
						 }else if(qntfi >= qntp){
							 request.getRequestDispatcher("/index.jsp").forward(request, response);
						 }
						 }
			}
			catch(Exception er) {er.printStackTrace();}
	}

}