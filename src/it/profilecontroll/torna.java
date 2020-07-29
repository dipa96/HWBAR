package it.profilecontroll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class torna
 */
@WebServlet("/torna")
public class torna extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(true);//Fetch session object 
		if(session.getAttribute("id")!=null) {
			 try {
				 if(session.getAttribute("ruolo").equals("user")) {
	             request.setAttribute("reload", "document.getElementById(\"orderstory\").click();");
	             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
		            dispatcher.forward(request, response);
				 }else if(session.getAttribute("ruolo").equals("admin")) {
					 int pointer = Integer.parseInt(request.getParameter("pointer"));
					 if (pointer == 1) {
		             request.setAttribute("reload", "document.getElementById(\"AOrd5\").click();");
		             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
			            dispatcher.forward(request, response);
					 }else if (pointer == 2) {
			             request.setAttribute("reload", "document.getElementById(\"SOrd6\").click();");
			             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
				            dispatcher.forward(request, response);
						 }else if (pointer == 3) {
				             request.setAttribute("reload", "document.getElementById(\"ComOrd7\").click();");
				             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
					            dispatcher.forward(request, response);
							 }else if (pointer == 4) {
					             request.setAttribute("reload", "document.getElementById(\"BlockOrd8\").click();");
					             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
						            dispatcher.forward(request, response);
								 }else if (pointer == 5) {
						             request.setAttribute("reload", "document.getElementById(\"DelOrd9\").click();");
						             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
							            dispatcher.forward(request, response);
									 }else if (pointer == 6) {
							             request.setAttribute("reload", "document.getElementById(\"Ass11\").click();");
							             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
								            dispatcher.forward(request, response);
										 }
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
