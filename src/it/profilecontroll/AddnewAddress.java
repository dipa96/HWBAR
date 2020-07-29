package it.profilecontroll;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.util.connessionedb;

/**
 * Servlet implementation class AddnewAddress
 */
@WebServlet("/AddnewAddress")
public class AddnewAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		int id = (int) session.getAttribute("id");
		String addr = request.getParameter("indirizzoad");
		String cityad = request.getParameter("cityad");
		int capad = Integer.parseInt(request.getParameter("capad"));
		String num_tel = request.getParameter("num_tel");
		String nome = request.getParameter("nomead");
		String cognome = request.getParameter("cognomead");
		int civicoad = Integer.parseInt(request.getParameter("civico"));
		Connection con;
		PreparedStatement ps;
		if(session.getAttribute("id")!=null) {
		try {
			con = connessionedb.createConnection();
			String checkquery = "SELECT COUNT(*) FROM indirizzo_sped WHERE users_id='"+id+"' AND status = '0'";
			int flag = 0;				
			ps = con.prepareStatement(checkquery);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				 flag = rs.getInt(1);
			 }
			if (flag < 3) { 
			String addpay ="insert into indirizzo_sped values (?,?,?,?,?,?,?,?,?,?);";
			System.out.println("Connesso, procedo ad aggiungere nuovo indirizzo!");
			ps = con.prepareStatement(addpay);
			ps.setString(1, null);
			ps.setInt(2, id);
			ps.setString(3, addr);
			ps.setString(4, cityad);
			ps.setInt(5, capad);
			ps.setString(6, num_tel);
			ps.setString(7, nome);
			ps.setString(8, cognome);
			ps.setInt(9, 0);
			ps.setInt(10, civicoad);
			int i = ps.executeUpdate();
			if(i>0) {
				con.close();
		        request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-success\" role=\"alert\"> Indirizzo di spedizione aggiunto con successo! </div>  </div>  ");
		        request.setAttribute("reload", "document.getElementById(\"address\").click();");
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
	            dispatcher.forward(request, response);
			}else {
				con.close();
		        request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-danger\" role=\"alert\"> Errore nell'inserimento di un nuovo metodo di pagamento, contatta un'amministratore! </div>  </div>  "); 
		        request.setAttribute("reload", "document.getElementById(\"address\").click();");
		        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
	            dispatcher.forward(request, response);
			}
			}else {
				con.close();
		        request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-warning\" role=\"alert\"> Attenzione, possiedi gi&agrave; 3 indirizzi diversi, se desideri aggiurne un altro dovresti eliminarne almeno 1. </div>  </div>  "); 
		        request.setAttribute("reload", "document.getElementById(\"address\").click();");
		        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
	            dispatcher.forward(request, response);
			}
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