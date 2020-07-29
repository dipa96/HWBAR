package it.profilecontroll;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;

import it.util.*;
import it.bean.*;

@WebServlet("/userupdate")
public class userupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String indirizzo = request.getParameter("indirizzo");
		String city = request.getParameter("city");
		String cap = request.getParameter("cap");
		String dnascita = request.getParameter("dnascita");
		String ntel1 = request.getParameter("ntel1");
		String nomeh = request.getParameter("nomeh");
		String cognomeh = request.getParameter("cognomeh");
		String indirizzoh = request.getParameter("indirizzoh");
		String cityh = request.getParameter("cityh");
		String caph = request.getParameter("caph");
		String dnascitah = request.getParameter("dnascitah");
		String ntel1h = request.getParameter("ntel1h");
		HttpSession session = request.getSession(true);
		Connection con;
		Statement st;
		PrintWriter out = response.getWriter();
		if(session.getAttribute("id")!=null) {
		if(nome.equals("")) nome = nomeh;
		if(cognome.equals("")) cognome = cognomeh;
		if(indirizzo.equals("")) indirizzo = indirizzoh;
		if(city.equals("")) city = cityh;
		if(cap.equals("")) cap = caph;
		if(dnascita.equals("")) dnascita = dnascitah;
		if(ntel1.equals("")) ntel1 = ntel1h;
		try {
			con = connessionedb.createConnection();
			int caps = Integer.parseInt(cap);
			String query ="UPDATE users SET nome = '"+nome+"', cognome = '"+cognome+"', indirizzo = '"+indirizzo+"', dnascita = '"+dnascita+"' , city = '"+city+"' , cap = '"+caps+"' , ntel1 = '"+ntel1+"' where id = '"+id+"'";
			System.out.println("Connesso, procedo ad aggiornare!");
			st = con.createStatement();
	        st.executeUpdate(query);
	        con.close();
	        System.out.println("Chiudo la connessione, l'utente con id: "+id+" � stato aggiornato correttamente");
	        session.setAttribute("username", nome);
            session.setAttribute("cognome", cognome);
            session.setAttribute("indirizzo", indirizzo);
            session.setAttribute("cap", cap);
            session.setAttribute("city", city);
            session.setAttribute("dnascita", dnascita);
            session.setAttribute("ntel1", ntel1);
            request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
             		"	<div class=\"alert alert-success\" role=\"alert\"> Profilo aggiornato con successo! </div>  </div>  "); 
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
            dispatcher.forward(request, response);
			}
		catch(Exception er) {er.printStackTrace();}}
        else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
