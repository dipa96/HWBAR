package it.cartcontroll;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Ncartdelete , eliminare completamente prodotto
 */
@WebServlet("/Ncartdelete")
public class Ncartdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getHeader("referer");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OspiteCartGenerator");
		HttpSession session = request.getSession(true);
		ArrayList alok = new ArrayList();
		ArrayList pid_listred = new ArrayList();
        ArrayList pid_list = new ArrayList();
		Connection con;
		PreparedStatement ps;
        int idp = Integer.parseInt(request.getParameter("idpo"));
        String nome = "";
        int qnt = 1;
        int countc = 0;
        double totale = 0.00;
        double multi = 0.00;
    	try {
    		if(session.getAttribute("ospitecartid")!=null) {
	        	ArrayList al = (ArrayList) session.getAttribute("ospitecart");
	        	System.out.println("pre remove: "+al);
	        	session.removeAttribute("ospitecart");
	        	Iterator itr1 = al.iterator();
	        	int count = 0;
                while (itr1.hasNext()) {
                ArrayList pList1 = (ArrayList) itr1.next();
                if((int)pList1.get(1)==idp ) {
                	  System.out.println("Ncartdelete stampa pilist1: "+pList1);
                	alok.add(pList1);
                   System.out.println("Ncartdelete stampa alok: "+alok);
                }
                
                pid_list.add(pList1);
                }
                pid_list.removeAll(alok);
                System.out.println("Ncartdelete stampa: "+pid_list);
                session.setAttribute("ospitecart", pid_list);
                	
	        }
    		 ArrayList al1 = (ArrayList) session.getAttribute("ospitecart");
    		 if(al1 == null) {
	        		session.removeAttribute("ospitecartid");
	        		session.removeAttribute("ospitecart");
    		 }

    	}catch(Exception e) {e.printStackTrace();}

        response.sendRedirect(url);//metodo per post per cambiare pagina
		System.out.println("Connessione chiusa");
        
	}


}
