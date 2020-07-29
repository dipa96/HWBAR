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
 * Servlet implementation class CartsetqntDetails
 */
@WebServlet("/CartsetqntDetails")
public class CartsetqntDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int idprodotto = Integer.parseInt(request.getParameter("idprodotto"));
		 int idcart = Integer.parseInt(request.getParameter("idcart"));
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
				 if (qntfi <= qntp) {
				 String dlt ="UPDATE ordini_prodotti SET qnt = '"+qntfi+"' WHERE ordini_user_id ='"+idcart+"' and prodotti_id='"+idprodotto+"';";
				 st = con.createStatement();
				 st.executeUpdate(dlt);
		         con.close();
		         RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
	             dispatcher.include(request, response);
	             request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
		             		"	<div class=\"alert alert-success\" role=\"alert\">Prodotto aggiunto. </div>  </div>  ");
	             request.getRequestDispatcher("/userarea/usercart.jsp").forward(request, response);
				 }else if(qntfi >= qntp){
					 request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
			             		"	<div class=\"alert alert-danger\" role=\"alert\">Errore, purtroppo al momento non disponiamo dei prodotti necessari nel magazzino. </div>  </div>  ");
					 request.getRequestDispatcher("/userarea/usercart.jsp").forward(request, response);
				 }
			}
			catch(Exception er) {er.printStackTrace();}
	}

}