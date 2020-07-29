package it.cartcontroll;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
 * Servlet implementation class OspitecartAdd
 */
@WebServlet("/OspitecartAdd")
public class OspitecartAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getHeader("referer");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OspiteCartGenerator"); //call
		HttpSession session = request.getSession(true);
		ArrayList alok = null;
		ArrayList pid_listred = new ArrayList(); 
        ArrayList pid_list = new ArrayList();
		Connection con;
		PreparedStatement ps;
        int idp = Integer.parseInt(request.getParameter("idpo"));
        String nome = "";
        int qnt = 1;
        double price = Double.parseDouble(request.getParameter("price"));
        int countc = 0;
        double totale = 0.00;
        double multi = 0.00;
    	try {
    		con = connessionedb.createConnection();
    		String sltqnt = "SELECT * from prodotti WHERE id ='"+idp+"'";
    		ps = con.prepareStatement(sltqnt);
			ResultSet rs1 = ps.executeQuery();
			while(rs1.next()) {
				nome=rs1.getString(2);
				System.out.println(nome);
			}
	        if(session.getAttribute("ospitecartid")==null) { // sessione ospitecart
	        	dispatcher.include(request, response); //chiamata ospitecartgenerator
	        	//creo un array con dati prodotto
	        	pid_listred.add(session.getId());
	        	pid_listred.add(idp);
	        	pid_listred.add(nome);
	        	pid_listred.add(price);
	        	pid_listred.add(qnt);
	        	//aggiungo array creato prima in un altro array pid_listred
	        	pid_list.add(pid_listred); 
	        	
	        	session.setAttribute("ospitecart", pid_list);
	        }
	        else if(session.getAttribute("ospitecartid")!=null) {  //se il carrello è già pieno
	        	ArrayList al = (ArrayList) session.getAttribute("ospitecart"); //prendo ospitecart e lo metto in al
	        	System.out.println(al);
	        	if(al!=null) {  //controllo se il carrello è stato svuotato
	        	session.removeAttribute("ospitecart"); //svuoto ospitecart
	        	Iterator itr1 = al.iterator(); //iteratore
	        	int count = 0;
                while (itr1.hasNext()) { //finchè al è pieno
                ArrayList pList1 = (ArrayList) itr1.next(); // aggiungo il singolo prodotto a pList1
                if((int)pList1.get(1)==idp) {        // verifico se il prodotto è già nel carrello
                	int qnts =(int) pList1.get(4) + 1; //se il prodotto è già nel carrello aggiungo +1
                	pList1.set(4, qnts);
                	count++;
                }
            	pid_list.add(pList1);  //aggiungo tutto a pid_list
                session.setAttribute("ospitecart", pid_list); //carico in sessione ospitecart (vuoto)
                }
                if(count<1) {  //se non è nel carrello
	        	pid_listred.add(session.getId());
	        	pid_listred.add(idp);
	        	pid_listred.add(nome);
	        	pid_listred.add(price);
	        	pid_listred.add(qnt);
	        	al.add(pid_listred);
	        	session.setAttribute("ospitecart", al);
                }
	        	}else if(al == null) {  //controllo se al è vuoto ed elimino
	        		session.removeAttribute("ospitecartid");
	        		session.removeAttribute("ospitecart");
		        	dispatcher.include(request, response);
		        	pid_listred.add(session.getId());
		        	pid_listred.add(idp);
		        	pid_listred.add(nome);
		        	pid_listred.add(price);
		        	pid_listred.add(qnt);
		        	pid_list.add(pid_listred);
		        	session.setAttribute("ospitecart", pid_list);
	        	}
	        }
			con.close();
    	}catch(Exception e) {e.printStackTrace();}

        response.sendRedirect(url);//metodo per post per cambiare pagina
		System.out.println("Connessione chiusa");
        
	}


}
