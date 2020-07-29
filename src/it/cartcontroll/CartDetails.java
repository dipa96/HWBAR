package it.cartcontroll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CartDetails
 */
@WebServlet("/CartDetails")
public class CartDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);//Fetch session object
		Object ruolo = "not_logged";
		if((session.getAttribute("ruolo") != null)){
			ruolo = session.getAttribute("ruolo");
		}else if((session.getAttribute("ruolo") == null && session.getAttribute("ospitecartid")!=null)){
			ruolo = "first_login";
		}
		if((ruolo.equals("user")) ){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
            dispatcher.include(request, response);
			request.getRequestDispatcher("/userarea/usercart.jsp").forward(request, response);
		}else if(ruolo.equals("first_login")){
			request.setAttribute("errorMessage", "Devi prima effettuare il log-in!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
