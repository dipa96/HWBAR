package it.admin;

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
 * Servlet implementation class ProductAdmin
 */
@WebServlet("/ProductAdmin")
public class ProductAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession(true);//Fetch session object 
        String ruolo = (String)session.getAttribute("ruolo");
        PrintWriter out = response.getWriter();
        Connection con = null;
        Statement st;
        RequestDispatcher view;
        if(session.getAttribute("id")!=null || ruolo.equals("admin")) {
        try {
            con = connessionedb.createConnection();
            System.out.println("Connected!");   
            ArrayList alp = null;
            ArrayList pid_listp = new ArrayList();
            String query = "SELECT prodotti.id, prodotti.nome, prodotti.prezzo, prodotti.deposito, prodotti.descrizione,prodotti.categorie_idcategorie, categorie.nome,prodotti.path, prodotti.status\r\n" + 
            				"FROM prodotti \r\n" + 
            				"INNER JOIN categorie\r\n" + 
            				"ON prodotti.categorie_idcategorie=categorie.idcategorie WHERE status = '1'\n" +
            				"ORDER BY categorie.idcategorie";
            System.out.println("query " + query);
            st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
 
            while (rs.next()) {
                alp = new ArrayList();

                alp.add(rs.getInt(1));     // id prodotto
                alp.add(rs.getString(2));  // nome prodotto
                alp.add(rs.getString(3));  // prezzo prodotto
                alp.add(rs.getInt(4));  // deposito prodotto
                alp.add(rs.getString(5));  // descrizione prodotto
                alp.add(rs.getInt(6));  // id categoria prodotto
                alp.add(rs.getString(7));     // nome categoria prodotto
                alp.add(rs.getString(8));     // path dell'immagine
                alp.add(rs.getInt(9));     // status prodotto
                
 
                System.out.println("al :: " + alp);
                pid_listp.add(alp);
                
            }

            request.setAttribute("piListp", pid_listp);
            view = request.getRequestDispatcher("amministrazione/amministrazione.jsp");
            con.close();
            System.out.println("Disconnesso!");
        } catch (Exception e) {
            e.printStackTrace();
        }
}
        else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
        	}

}

