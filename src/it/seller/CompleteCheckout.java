package it.seller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.bean.LoginBean;
import it.cartcontroll.CartGenerator;

/**
 * Servlet implementation class CompleteCheckout
 */
@WebServlet("/CompleteCheckout")
public class CompleteCheckout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);//Fetch session object
		int id_cart = Integer.parseInt(request.getParameter("id_cart"));
		int id_indirizzo = Integer.parseInt(request.getParameter("id_indirizzo"));
		int id_pagamento = Integer.parseInt(request.getParameter("id_pagamento"));
		String totalev = request.getParameter("totale");
		int id_user = (int) session.getAttribute("id");
		System.out.println(totalev);
		SellCart seller = new SellCart();
		String checkup = seller.seller(id_pagamento, id_indirizzo, id_cart, id_user, totalev);
		boolean check = false;
		if (checkup.equals("Checkout_ok")) {
			LoginBean loginBean = new LoginBean();
			CartGenerator cart = new CartGenerator();
			loginBean.setIdcostumer(id_user);
			 String cartstatus = cart.generateCart(loginBean);
             int setidcart = cart.setidcart();
             try {
                 System.out.println("Controllo e inizio generazione carrello.");
                 if(cartstatus.equals("carrello_generato")) {
                	 System.out.println("Carrello non presente");
                	 System.out.println("Carrello generato");
                	 System.out.println("Carrello vuoto");
                	 session.setAttribute("idcart",setidcart);
                	 System.out.println("id carrello: "+session.getAttribute("idcart")+"");
                	 check = true;
                	 
                 }else if(cartstatus.equals("carrello_caricato")) {
                	 System.out.println("Carrello con status 0 presente.");
                	 System.out.println("Caricamento carrello");
                	 session.setAttribute("idcart",setidcart);
                	 System.out.println("id carrello: "+session.getAttribute("idcart")+"");
                	 check = true;
                 }}catch(Exception e) {e.printStackTrace();}
             if (check == true) {
                 System.out.println("Check carrello.......");
                 System.out.println("Check carrello.......");
                 System.out.println("ok");
                 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CartShow");
                 dispatcher.include(request, response);
                 }
             	request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
              		"	<div class=\"alert alert-success\" role=\"alert\"> Acquisto completato! Grazie per aver acquistato su hwbar! I dettagli dell'ordine, lo stato e la ricevuta sono disponibili sul <form id=\"showp\" action=\"<%=request.getContextPath()%>/showp\" method=\"post\">	<a class=\"dropdown-item\" href=\"javascript:{}\" onclick=\"document.getElementById('showp').submit();\"><strong>tuo pannello utente</strong></a></form> </div>  </div>  "); 
             	request.setAttribute("Messagemodal", "$('#ServletMessagem').modal('show');");
             	request.setAttribute("Messaget", "Acquisto completato!");
             	request.getRequestDispatcher("/index.jsp").forward(request, response);
             }else if (checkup.equals("Not_ok_q_problem")) {
            	 request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
                    		"	<div class=\"alert alert-warning\" role=\"alert\">L'acquisto non &egrave; andato a buon fine, uno o pi&ugrave; prodotti non sono pi&ugrave; disponibili. La preghiamo di effettuare l'acquisto pi&ugrave tardi. Ci scusiamo per il disagio! </div>  </div>  "); 
                 	 request.setAttribute("Messagemodal", "$('#ServletMessagem').modal('show');");
                 	request.setAttribute("Messaget", "Attenzione!");
                 	 request.getRequestDispatcher("/index.jsp").forward(request, response);  
             }
		else {
            	 request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
               		"	<div class=\"alert alert-danger\" role=\"alert\">L'acquisto non &egrave; andato a buon fine, ti consigliamo di contattare un amministratore per risolvere il problema </div>  </div>  "); 
            	 request.setAttribute("Messagemodal", "$('#ServletMessagem').modal('show');");
            	 request.getRequestDispatcher("/index.jsp").forward(request, response); }
		}
	}

