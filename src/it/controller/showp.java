package it.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class showp
 */
@WebServlet("/showp")
public class showp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);//Fetch session object
		Object ruolo = "not_logged";
		if((session.getAttribute("ruolo") != null)){
			ruolo = session.getAttribute("ruolo");
		}
		if((ruolo.equals("user")) ){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showpay");
            dispatcher.include(request, response);
            RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/ShowAddress");
            dispatcher1.include(request, response);
            RequestDispatcher dispatcher2 = getServletContext().getRequestDispatcher("/OrderHistory");
            dispatcher2.include(request, response);
			request.getRequestDispatcher("/userarea/profilo.jsp").forward(request, response);
		}
		else if ((ruolo.equals("admin")) ){
			RequestDispatcher dispatcher3 = getServletContext().getRequestDispatcher("/OrderAdmin");
            dispatcher3.include(request, response);
            RequestDispatcher dispatcher4 = getServletContext().getRequestDispatcher("/ProductAdmin");
            dispatcher4.include(request, response);
            RequestDispatcher dispatcher5 = getServletContext().getRequestDispatcher("/Ticketview");
            dispatcher5.include(request, response);
			request.getRequestDispatcher("amministrazione/amministrazione.jsp").forward(request, response);
			}else {
				request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		
	}


}
