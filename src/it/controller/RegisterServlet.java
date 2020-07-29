package it.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.util.*;
/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out = response.getWriter();
	Connection con = null;
	PreparedStatement ps = null;
	String email = request.getParameter("email");
	String nome = request.getParameter("nome");
	String cognome = request.getParameter("cognome");
	String indirizzo = request.getParameter("indirizzo");
	String city = request.getParameter("city");
	String cap = request.getParameter("cap");
	String dnascita = request.getParameter("dnascita");
	String ntel1 = request.getParameter("ntel1");
	String password = request.getParameter("password");
	String rpassword = request.getParameter("rpassword");
	String ruolo="user";
	String tempcheck= "";
	
	
	try {
		int caps = Integer.parseInt(cap);
		con = connessionedb.createConnection();
		String checkquery = "select * from users where email ='"+email+"';";
		int flag = 0;
		
		ps = con.prepareStatement(checkquery);
		ResultSet rs = ps.executeQuery();
		 if(rs.next()) {
			 tempcheck=rs.getString(2);
			 flag++;
		 }
		 if (flag < 1) {
		String query = "insert into users values (?,?,?,?,?,?,?,?,?,?,?);";
		ps = con.prepareStatement(query);
		ps.setString(1, null);
		ps.setString(2, email);
		ps.setString(3, nome);
		ps.setString(4, cognome);
		ps.setString(5, indirizzo);
		ps.setString(6, dnascita);
		ps.setString(7, city);
		ps.setInt(8, caps);
		ps.setString(9, ntel1);
		ps.setString(10, password);
		ps.setString(11, ruolo);
		int i = ps.executeUpdate();
		if(i>0) {
			System.out.println("Registrazione effettuata");
			 request.setAttribute("errMessage", "Registrazione completata! Effettua il login!");
			request.getRequestDispatcher("login.jsp").forward(request, response);//metodo per post per cambiare pagina
			con.close();
			System.out.println("Connessione chiusa");
		}
	}else {   
	out.print("Errore registrazione");
	request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
     		"	<div class=\"alert alert-danger\" role=\"alert\"> Attenzione, la mail che hai inserito &egrave; gi&agrave; esistente! </div>  </div>  ");
	request.getRequestDispatcher("register.jsp").forward(request, response);//metodo per post per cambiare pagina
	con.close();
	out.print("Connessione chiusa");  }
	}
	catch (Exception ee) { ee.printStackTrace();}	
	}
	

}
