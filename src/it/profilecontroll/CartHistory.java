package it.profilecontroll;

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

import it.bean.OrdiniProdotti;
import it.util.connessionedb;

/**
 * Servlet implementation class CartHistory
 */
@WebServlet("/CartHistory")
public class CartHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		Connection con;
		Statement st;
		ResultSet rsok;
		RequestDispatcher view;
		PrintWriter out = response.getWriter();
		ArrayList al = null;
		ArrayList alok = null;
        ArrayList pid_list = new ArrayList();
        int idcart = Integer.parseInt(request.getParameter("idch"));
        String data = request.getParameter("cartdate");
        int flag = 0;
        double tot = 0.00;
        double multi = 0.00;
        int qnt = 0;
        if(session.getAttribute("id")!=null) {
		try {
			con = connessionedb.createConnection();
			String query = "select  prodotti.nome, ordini_prodotti.totalep,ordini_prodotti.qnt, ordini_prodotti.prodotti_id, prodotti.descrizione\n" + 
					"from prodotti \n" + 
					"inner join ordini_prodotti\n" + 
					"on  prodotti.id=ordini_prodotti.prodotti_id \n" + 
					"where ordini_prodotti.ordini_user_id='"+idcart+"';";
	        st = con.createStatement();
	        rsok=st.executeQuery(query);
	        while(rsok.next()) {
	        	alok = new ArrayList();      	
	        	alok.add(rsok.getString("prodotti.nome"));
	        	alok.add(rsok.getDouble("ordini_prodotti.totalep"));
	        	alok.add(rsok.getInt("qnt"));
	        	alok.add(rsok.getInt("prodotti_id"));
	        	multi = (double)alok.get(1) * (int) alok.get(2);
	        	tot= tot+ multi;
	        	alok.add(tot);
	        	alok.add(rsok.getString("prodotti.descrizione"));
	        	System.out.println("al :: " + alok);
                pid_list.add(alok);   
	        }
	        con.close();
	        request.setAttribute("cartList", pid_list);
	        request.setAttribute("data", data);
	        request.getRequestDispatcher("/userarea/usercarthistory.jsp").forward(request, response);
            System.out.println("Disconnesso!");
		}catch(Exception e) {}}
        else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}