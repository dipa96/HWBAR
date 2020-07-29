package it.seller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.bean.CheckoutBean;

/**
 * Servlet implementation class PreCheck
 */
@WebServlet("/PreCheck")
public class PreCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);//Fetch session object
		Object ruolo = "not_logged";
		int id_indirizzo = Integer.parseInt(request.getParameter("id_indirizzo"));
		int id_pagamento = Integer.parseInt(request.getParameter("id_pagamento"));
		int id_user = (int) session.getAttribute("id");
		int stato = Integer.parseInt(request.getParameter("stato"));
		CheckoutBean checkbean = new CheckoutBean();
		if((session.getAttribute("ruolo") != null)){
			ruolo = session.getAttribute("ruolo");
		}
		if((ruolo.equals("user")) ){
			if(stato == 0) {
            RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/ShowAddress");
            dispatcher1.include(request, response);
			request.getRequestDispatcher("/userarea/pre-checkout.jsp").forward(request, response);
			}else if (stato == 1) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showpay");
	            dispatcher.include(request, response);
	            request.setAttribute("id_indirizzo", id_indirizzo);
	            request.getRequestDispatcher("/userarea/pre-checkout2.jsp").forward(request, response);
			}
			else if (stato == 2) {
				checkbean.setId_indi(id_indirizzo);
				checkbean.setId_pag(id_pagamento);
				checkbean.setId_user(id_user);
				ReadlastData read = new ReadlastData();
				String statolettura = read.ReadData(checkbean);
				if (statolettura.equals("Lettura_ok")) {
					//setta gli attributi dell'indirizzo
					request.setAttribute("id_indirizzo", checkbean.getId_indi());
					request.setAttribute("indirizzo", checkbean.getIndirizzo());
					request.setAttribute("civico", checkbean.getCivico());
					request.setAttribute("city", checkbean.getCity());
					request.setAttribute("cap", checkbean.getCap());
					request.setAttribute("num_tel", checkbean.getIndirizzo_numero());
					request.setAttribute("nomeindirizzo", checkbean.getIndirizzo_nome());
					request.setAttribute("cognomeindirizzo", checkbean.getIndirizzo_cognome());
					//setta gli attributi del pagamento
					request.setAttribute("id_pagamento", checkbean.getId_pag());
					request.setAttribute("circuito", checkbean.getCircuito());
					request.setAttribute("num_carta", checkbean.getNum_carta());
					request.setAttribute("intestatario", checkbean.getIntestatario_carta());
					request.setAttribute("scad", checkbean.getScad_carta());
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
		            dispatcher.include(request, response);
					request.getRequestDispatcher("/userarea/pre-checkout3.jsp").forward(request, response);
				}				
			}else if (stato == 3) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
	            dispatcher.include(request, response);
				request.getRequestDispatcher("/userarea/usercart.jsp").forward(request, response);
			}
		}
		else {
				request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		
	}


}