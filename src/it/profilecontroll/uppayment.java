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

import it.util.connessionedb;

/**
 * Servlet implementation class updatepagamento
 */
@WebServlet("/uppayment")
public class uppayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		int id = (int) session.getAttribute("id");
		int id_pag = Integer.parseInt(request.getParameter("id_pagamento"));
		String intestatario = request.getParameter("intestatario");
		String scad = request.getParameter("scad");
		String intestatarios = request.getParameter("samename");
		String scads = request.getParameter("samedate");
		Connection con;
		Statement st;
		PreparedStatement ps;
		if(session.getAttribute("id")!=null) {
		if (intestatario.equals("")) intestatario = intestatarios;
		if (scad.equals("")) scad = scads;
		try {
			con = connessionedb.createConnection();
			String upd ="UPDATE pagamento SET scad = '"+scad+"' , intestatario = '"+intestatario+"' WHERE id ='"+id_pag+"' AND users_id ='"+id+"';";
			System.out.println("Connesso, procedo ad aggiornare!");
			st = con.createStatement();
	        st.executeUpdate(upd);
	        System.out.println("Aggiornato il metodo di pagamento dell'utente con id "+id+", chiudo la connessione!");
	        con.close();
	        request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
             		"	<div class=\"alert alert-success\" role=\"alert\"> Metodo di pagamento aggiornato con successo! </div>  </div>  ");
	        request.setAttribute("reload", "document.getElementById(\"payment\").click();");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
            dispatcher.forward(request, response);
			}
			catch(Exception er) {
				er.printStackTrace();
			}}
        else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		}
		}