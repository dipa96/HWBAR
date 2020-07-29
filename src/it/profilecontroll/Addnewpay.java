package it.profilecontroll;

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
import javax.servlet.http.HttpSession;

import it.util.connessionedb;

/**
 * Servlet implementation class Addnewpay
 */
@WebServlet("/Addnewpay")
public class Addnewpay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		int id = (int) session.getAttribute("id");
		String circuito = request.getParameter("circuito");
		String numcard = request.getParameter("numcard");
		int cvc = Integer.parseInt(request.getParameter("cvc"));
		String scad = request.getParameter("scadadd");
		String intestatario = request.getParameter("intes");
		Connection con;
		PreparedStatement ps;
		String checkquery = "SELECT COUNT(*) FROM pagamento WHERE users_id='"+id+"' AND status = '0'";
		int flag = 0;				
		if(session.getAttribute("id")!=null) {
		try {
			con = connessionedb.createConnection();
			ps = con.prepareStatement(checkquery);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				 flag = rs.getInt(1);
			 }
			if (flag < 3) { 
			String addpay ="insert into pagamento values (?,?,?,?,?,?,?,?);";
			System.out.println("Connesso, procedo ad aggiungere il nuovo metodo di pagamento!");
			ps = con.prepareStatement(addpay);
			ps.setString(1, null);
			ps.setInt(2, id);
			ps.setString(3, circuito);
			ps.setString(4, numcard);
			ps.setInt(5, cvc);
			ps.setString(6, scad);
			ps.setString(7, intestatario);
			ps.setInt(8,0);
			int i = ps.executeUpdate();
			if(i>0) {
				con.close();
		        request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-success\" role=\"alert\"> Metodo di pagamento aggiunto con successo! </div>  </div>  ");
		        request.setAttribute("reload", "document.getElementById(\"payment\").click();");
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
	            dispatcher.forward(request, response);
			}else {
				con.close();
		        request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-danger\" role=\"alert\"> Errore nell'inserimento di un nuovo metodo di pagamento, contatta un'amministratore! </div>  </div>  "); 
		        request.setAttribute("reload", "document.getElementById(\"payment\").click();");
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
	            dispatcher.forward(request, response);
			}
			}else {
					con.close();
			        request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
		             		"	<div class=\"alert alert-danger\" role=\"alert\"> Attenzione, possiedi gi&agrave; 3 metodi di pagamento diversi, se desideri aggiurne un altro dovresti eliminarne almeno 1. </div>  </div>  "); 
			        request.setAttribute("reload", "document.getElementById(\"payment\").click();");
			        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
		            dispatcher.forward(request, response);
			}
	        
		}
			catch(Exception er) {
				er.printStackTrace();
			}}
        else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);}
		}
		}