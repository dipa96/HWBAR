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
 * Servlet implementation class NewTicket
 */
@WebServlet("/NewTicket")
public class NewTicket extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		int id = (int) session.getAttribute("id");
		String testo = request.getParameter("problema");
		String tipo = request.getParameter("title");
		String tipoandtesto =tipo+": "+testo;
		Connection con;
		PreparedStatement ps;
		if(session.getAttribute("id")!=null) {
		try {
			con = connessionedb.createConnection();
			int flag = 0;
			String check = "SELECT * FROM assistenza WHERE users_id = '"+id+"' AND stato = '0'";
			ps = con.prepareStatement(check);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				flag ++;
			}
			if (flag < 1) {
				System.out.println("Non ci sono altri ticket, procedo a inviare il nuovo");
				String inserq = "INSERT INTO assistenza VALUES (?,?,?,?)";
				ps = con.prepareStatement(inserq);
				ps.setString(1,null);
				ps.setInt(2, id);
				ps.setInt(3, 0);
				ps.setString(4, tipoandtesto);
				int i = ps.executeUpdate();
				if (i > 0) {
					System.out.println("Ticket inserito con successo!");
				}else System.out.println("Errore nell'eseguire l'insert");
				con.close();
			}else if (flag > 0){
				con.close();
		        request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-warning\" role=\"alert\"> Attenzione, hai gi&agrave; un ticket aperto, ti invitiamo ad aspettare che un'amministratore risponda. Controlla la tua casella postale(mail) associata al tuo account! </div>  </div>  "); 
		        request.setAttribute("reload", "document.getElementById(\"assistenza\").click();");
		        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
	            dispatcher.forward(request, response);
			}
	        request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
             		"	<div class=\"alert alert-success\" role=\"alert\"> Ticket inviato con successo, un'amministratore risponder&agrave; il prima possibile.Ti invitiamo a controllare la tua mail(associata all'account). Grazie per la segnalazione! </div>  </div>  "); 
	        request.setAttribute("reload", "document.getElementById(\"assistenza\").click();");
	        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
            dispatcher.forward(request, response);
		}catch (Exception e) {e.printStackTrace();}}else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
