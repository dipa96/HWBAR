package it.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.util.Mailer;
import it.util.connessionedb;

/**
 * Servlet implementation class RispTicket
 */
@WebServlet("/RispTicket")
public class RispTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);//Fetch session object 
        String ruolo = (String)session.getAttribute("ruolo");
		if(session.getAttribute("id")!=null && ruolo.equals("admin")) {
			String problemar = request.getParameter("problemar");
			String mailuser = request.getParameter("utente");
			int idtick = Integer.parseInt(request.getParameter("idtick"));
			Mailer sender = new Mailer();
			String stato=sender.send(mailuser, "HWBAR ASSISTENZA CLIENTI", problemar);
			try {
			if (stato.equals("inviata")) {
				Connection con = null;
				PreparedStatement ps = null;
				con = connessionedb.createConnection();
				String updstat = "UPDATE assistenza SET stato = '1' WHERE id = '"+idtick+"';";
				ps = con.prepareStatement(updstat);
				int i = ps.executeUpdate();
				if(i>0) {
					System.out.println("Ticket risposto con successo! Stato del ticket impostato a 1!");
					con.close();
					request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
		             		"	<div class=\"alert alert-success\" role=\"alert\"> Ticket risposto! </div>  </div>  "); 
		             request.setAttribute("reload", "document.getElementById(\"Ass11\").click();");
		             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
			            dispatcher.forward(request, response);
				}else if(i<1) {
					System.out.println("Errore nel effettuare l'update del ticket!");
					con.close();
					request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
		             		"	<div class=\"alert alert-danger\" role=\"alert\"> Errore nell'aggiornare il db! </div>  </div>  "); 
		             request.setAttribute("reload", "document.getElementById(\"Ass11\").click();");
		             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
			            dispatcher.forward(request, response);

				}
			}else if (stato.equals("problema")) {
				System.out.println("Errore nel mandare la mail all'utente!");
				request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-danger\" role=\"alert\"> Errore nel mandare la mail all'utente! </div>  </div>  "); 
	             request.setAttribute("reload", "document.getElementById(\"Ass11\").click();");
	             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
		            dispatcher.forward(request, response);
				
			}
			}catch (Exception e) {
				e.printStackTrace();
			request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
             		"	<div class=\"alert alert-danger\" role=\"alert\"> Errore fatale! </div>  </div>  "); 
             request.setAttribute("reload", "document.getElementById(\"Ass11\").click();");
             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
	            dispatcher.forward(request, response);}
			}else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
