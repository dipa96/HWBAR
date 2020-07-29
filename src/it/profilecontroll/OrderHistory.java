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

import it.util.connessionedb;

/**
 * Servlet implementation class OrderHistory
 */
@WebServlet("/OrderHistory")
public class OrderHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession(true);//Fetch session object
        PrintWriter out = response.getWriter();
        Connection con = null;
        int id = (int)session.getAttribute("id");
        Statement st;
        RequestDispatcher view;
        if(session.getAttribute("id")!=null) {
        try {
            con = connessionedb.createConnection();
            System.out.println("Connected!");   
            ArrayList al = null;
            ArrayList pid_listo = new ArrayList();
            String query = "SELECT ordini_user.id, ordini_user.data, ordini_user.status , ordini_user.totale,\r\n" + 
            		"pagamento.intestatario, pagamento.codice,\r\n" + 
            		"indirizzo_sped.indirizzo, indirizzo_sped.civico, indirizzo_sped.city, indirizzo_sped.cap\r\n" + 
            		"FROM ordini_user\r\n" + 
            		"INNER JOIN pagamento \r\n" + 
            		"ON  ordini_user.pagamento_id = pagamento.id\r\n" + 
            		"INNER JOIN indirizzo_sped\r\n" + 
            		"ON ordini_user.indirizzo_sped_id=indirizzo_sped.id\r\n" + 
            		"WHERE ordini_user.users_id = '"+id+"' AND ordini_user.status > '0'ORDER BY ordini_user.id DESC;";
            System.out.println("query " + query);
            st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
 
            while (rs.next()) {
                al = new ArrayList();

                al.add(rs.getInt(1));
                al.add(rs.getString(2));
                al.add(rs.getInt(3));
                al.add(rs.getString(4));
                al.add(rs.getString(5));
                al.add(rs.getString(6));
                al.add(rs.getString(7));
                al.add(rs.getInt(8));
                al.add(rs.getString(9));
                al.add(rs.getInt(10));
                
 
                System.out.println("al :: " + al);
                pid_listo.add(al);
            }
 
            request.setAttribute("piListo", pid_listo);
            view = request.getRequestDispatcher("/userarea/profilo.jsp");
            con.close();
            System.out.println("Disconnesso!");
        } catch (Exception e) {
            e.printStackTrace();
        }}
        else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
        	}
}