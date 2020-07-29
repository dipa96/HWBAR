package it.cartcontroll;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.util.connessionedb;

/**
 * Servlet implementation class NcartsetQnt
 */
@WebServlet("/NcartsetQnt")
public class NcartsetQnt extends HttpServlet {
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
        int mop =  Integer.parseInt(request.getParameter("mop"));
        String nome = "";
        int qnt = 1;
        int countc = 0;
        double totale = 0.00;
        double multi = 0.00;
    	try {
    		if(session.getAttribute("ospitecartid")!=null) {
	        	ArrayList al = (ArrayList) session.getAttribute("ospitecart");
	        	System.out.println(al);
	        	session.removeAttribute("ospitecart");
	        	Iterator itr1 = al.iterator();
	        	int count = 0;
                while (itr1.hasNext()) {
                ArrayList pList1 = (ArrayList) itr1.next();
                if((int)pList1.get(1)==idp) {
                	if(mop == 0) { // + mop
                	int qnts =(int) pList1.get(4) + 1;
                	pList1.set(4, qnts);
                	}else if (mop == 1) { // - mop
                    	int qnts =(int) pList1.get(4) - 1;
                    	if ( qnts > 0 ) { // se qnt è maggiore di 0
                    	pList1.set(4, qnts); 
                    	}else if (qnts < 1) { //se qut è minore di 1 == 0 ( - - - )
                    	alok.add(pList1);     
                    	}

                	}
                }
            	pid_list.add(pList1);
                
                }
                System.out.println("stampa1: "+pid_list);
                pid_list.removeAll(alok);    //rimuovi alok ( collezione )
                System.out.println("stampa2: "+pid_list);
                session.setAttribute("ospitecart", pid_list);

	        }

    	}catch(Exception e) {e.printStackTrace();}

        response.sendRedirect(url);//metodo per post per cambiare pagina
		System.out.println("Connessione chiusa");
        
	}


}