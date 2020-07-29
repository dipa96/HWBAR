package it.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Ticketanswer
 */
@WebServlet("/Ticketanswer")
public class Ticketanswer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);//Fetch session object 
        String ruolo = (String)session.getAttribute("ruolo");
		if(session.getAttribute("id")!=null && ruolo.equals("admin")) {
			String problema = request.getParameter("problema");
			String mailuser = request.getParameter("mail");
			int pointer = Integer.parseInt(request.getParameter("pointer"));
			int idtick = Integer.parseInt(request.getParameter("idtick"));
			request.setAttribute("utente", mailuser);
			request.setAttribute("pointer", pointer);
			request.setAttribute("problema", problema);
			request.setAttribute("idtick", idtick);
			request.getRequestDispatcher("amministrazione/risponditicket.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
            
	}

}
