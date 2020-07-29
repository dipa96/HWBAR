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
 * Servlet implementation class Ticketview
 */
@WebServlet("/Ticketview")
public class Ticketview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);//Fetch session object 
        String ruolo = (String)session.getAttribute("ruolo");
        PrintWriter out = response.getWriter();
        Connection con = null;
        Statement st;
        RequestDispatcher view;
        ArrayList altwo = null;
        ArrayList pid_listtwo = new ArrayList();
        if(session.getAttribute("id")!=null && ruolo.equals("admin")) {
            try { 
            	con = connessionedb.createConnection();
                System.out.println("Connected!");   
                String query2 = "SELECT assistenza.id , users.email , assistenza.stato , assistenza.messaggio FROM assistenza INNER JOIN users ON assistenza.users_id = users.id;";
                st = con.createStatement();
                ResultSet rs2 = st.executeQuery(query2);
                while (rs2.next()) {
                    altwo = new ArrayList();
                    altwo.add(rs2.getInt(1));
                    altwo.add(rs2.getString(2));
                    altwo.add(rs2.getInt(3));
                    altwo.add(rs2.getString(4));
                    pid_listtwo.add(altwo);
                    request.setAttribute("piListna", pid_listtwo);
                }
            	
            } catch (Exception e) {
                e.printStackTrace();
            }}
            else {
    			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
    			request.getRequestDispatcher("login.jsp").forward(request, response);
    		}
	}

}
