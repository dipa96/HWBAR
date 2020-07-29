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
 * Servlet implementation class AddtoCart
 */
@WebServlet("/AddtoCart")
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idproduct = Integer.parseInt(request.getParameter("id"));
		String priceproduct = request.getParameter("price");
		int idcart = Integer.parseInt(request.getParameter("idcart"));
		String url = request.getHeader("referer");
		Connection con;
		PreparedStatement ps;
		Statement st;
		int qntp = 0;
		int qnt = 0;
		int add = 1;
		String checkquery ="SELECT * from ordini_prodotti WHERE ordini_user_id ='"+idcart+"'AND prodotti_id ='"+idproduct+"'";
		String sltqnt = "SELECT * from prodotti WHERE id ='"+idproduct+"'";
		try {
			con = connessionedb.createConnection();
			int flag = 0;
			ps = con.prepareStatement(sltqnt);
			ResultSet rs1 = ps.executeQuery();
			if(rs1.next()) {
				qntp=rs1.getInt(4);
			}
			if(qntp == 0) {
				System.out.println("Prodotto OutofStock");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
	            dispatcher.include(request, response);
	            response.sendRedirect(url);//metodo per post per cambiare pagina
				con.close();
				System.out.println("Connessione chiusa");
			}else {
			ps = con.prepareStatement(checkquery);
			ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 qnt=rs.getInt(3);
				 flag++;
			 }
			 if(flag < 1) {
			String query = "INSERT INTO ordini_prodotti values(?,?,?,?);";
			ps = con.prepareStatement(query);
			ps.setInt(1, idcart);
			ps.setInt(2, idproduct);
			ps.setInt(3, add);
			ps.setString(4, priceproduct);
			int i = ps.executeUpdate();
			if(i>0) {
				System.out.println("Oggetto nel carrello aggiunto correttamente!");
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
	            dispatcher.include(request, response);
	            response.sendRedirect(url);//metodo per post per cambiare pagina
				con.close();
				System.out.println("Connessione chiusa");
			}}else if (flag > 0) {
				int qntupdated = 0;
				qntupdated ++;
				qntupdated = qnt + qntupdated;
				String qntquery="UPDATE ordini_prodotti SET qnt = '"+qntupdated+"' WHERE ordini_user_id ='"+idcart+"'AND prodotti_id ='"+idproduct+"'";
				st = con.createStatement();
				int i = st.executeUpdate(qntquery);
				if(i>0) {
					System.out.println("Oggetto nel carrello aggiunto correttamente!");
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
		             dispatcher.include(request, response);
		             response.sendRedirect(url);//metodo per post per cambiare pagina
					con.close();
					System.out.println("Connessione chiusa");
				}
			}
		}
		}
		catch(Exception e) { e.printStackTrace();}
	}

}
