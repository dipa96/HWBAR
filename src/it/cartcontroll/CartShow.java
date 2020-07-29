package it.cartcontroll;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import it.bean.*;
import it.util.connessionedb;
/**
 * Servlet implementation class CartShow
 */
@WebServlet("/CartShow")
public class CartShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Connection con;
		Statement st;
		ResultSet rs;
		ResultSet rsok;
		RequestDispatcher view;
		PrintWriter out = response.getWriter();
		OrdiniProdotti opro = new OrdiniProdotti();
		ArrayList al = null;
		ArrayList alok = null;
        ArrayList pid_list = new ArrayList();
        int flag = 0;
        double tot = 0.00;
        double multi = 0.00;
        int qnt = 0;
        if(session.getAttribute("id")!=null) {
        	int idcart = (int)session.getAttribute("idcart");
        	opro.setIdordiniuser(idcart);
		try {
			con = connessionedb.createConnection();
			String query = "select  prodotti.nome, prodotti.prezzo,ordini_prodotti.qnt, ordini_prodotti.prodotti_id\n" + 
					"from prodotti \n" + 
					"inner join ordini_prodotti\n" + 
					"on  prodotti.id=ordini_prodotti.prodotti_id \n" + 
					"where ordini_prodotti.ordini_user_id='"+idcart+"';";
			System.out.println("Connesso, carico prodotti del carrello con id: "+idcart);
			st = con.createStatement();
	        rs=st.executeQuery(query);
	        while(rs.next()) {
	        	al = new ArrayList();      	
	        	al.add(rs.getString("prodotti.nome"));
	        	al.add(rs.getDouble("prodotti.prezzo"));
	        	al.add(rs.getInt("qnt"));
	        	al.add(rs.getInt("prodotti_id"));
	        	al.add(tot);
	        	 if((int)al.get(2) == 0) {
		        	 String dlt ="DELETE FROM ordini_prodotti WHERE ordini_user_id ='"+idcart+"' and prodotti_id='"+al.get(3)+"';";
					 st = con.createStatement();
					 st.executeUpdate(dlt);
		        }
	        }
	        st = con.createStatement();
	        rsok=st.executeQuery(query);
	        while(rsok.next()) {
	        	alok = new ArrayList();      	
	        	alok.add(rsok.getString("prodotti.nome"));
	        	alok.add(rsok.getDouble("prodotti.prezzo"));
	        	alok.add(rsok.getInt("qnt"));
	        	alok.add(rsok.getInt("prodotti_id"));
	        	multi = (double)alok.get(1) * (int) alok.get(2);
	        	tot= tot+ multi;
	        	alok.add(tot);
	        	 if((int)alok.get(2) == 0) {
		        	 String dlt ="DELETE FROM ordini_prodotti WHERE ordini_user_id ='"+idcart+"' and prodotti_id='"+al.get(3)+"';";
					 st = con.createStatement();
					 st.executeUpdate(dlt);
		        }
	        	System.out.println("al :: " + alok);
                pid_list.add(alok);
                session.setAttribute("cartList", pid_list);
	        }
	        con.close();
	        session.setAttribute("cartList", pid_list);
            System.out.println("Disconnesso!");
		}catch(Exception e) {}}
        else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
