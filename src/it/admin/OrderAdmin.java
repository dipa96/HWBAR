package it.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.util.connessionedb;

/**
 * Servlet implementation class OrderConfirm
 */
@WebServlet("/OrderAdmin")
public class OrderAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession(true);//Fetch session object 
        String ruolo = (String)session.getAttribute("ruolo");
        PrintWriter out = response.getWriter();
        Connection con = null;
        Statement st;
        RequestDispatcher view;
        ArrayList altwo = null;
        ArrayList pid_listtwo = new ArrayList();
        ArrayList altre = null;
        ArrayList pid_listtre = new ArrayList();
        ArrayList alq = null;
        ArrayList pid_listq = new ArrayList();
        ArrayList aln = null;
        ArrayList pid_listn = new ArrayList();
        if(session.getAttribute("id")!=null && ruolo.equals("admin")) {
        try {
            con = connessionedb.createConnection();
            System.out.println("Connected!");   
            ArrayList alone = null;
            ArrayList pid_listone = new ArrayList();
            String query = "SELECT     ordini_user.id, ordini_user.data , ordini_user.totale,\r\n" + 
            		"              pagamento.intestatario, pagamento.codice,\r\n" + 
            		"              indirizzo_sped.indirizzo, indirizzo_sped.civico, indirizzo_sped.city, indirizzo_sped.cap,\r\n" + 
            		"              users.email\r\n" + 
            		"              \r\n" + 
            		"  FROM        ordini_user \r\n" + 
            		"  INNER JOIN  pagamento \r\n" + 
            		"  ON          ordini_user.pagamento_id = pagamento.id \r\n" + 
            		"  INNER JOIN  indirizzo_sped \r\n" + 
            		"  ON          ordini_user.indirizzo_sped_id=indirizzo_sped.id\r\n" + 
            		"  INNER JOIN  users\r\n" + 
            		"  ON          indirizzo_sped.users_id=users.id\r\n" + 
            		"  WHERE       ordini_user.status = '1' ORDER BY ordini_user.id DESC;";
            System.out.println("query " + query);
            st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
 
            while (rs.next()) {
                alone = new ArrayList();

                alone.add(rs.getInt(1));     //ordini_user.id
                alone.add(rs.getString(2));  //ordini_user.data
                alone.add(rs.getString(3));  //ordini_user.totale
                alone.add(rs.getString(4));  //pagamento.intestarario
                alone.add(rs.getString(5));  //pagamento.codice
                alone.add(rs.getString(6));  //indirizzo_sped.indirizzo
                alone.add(rs.getInt(7));     //indirizzo_sped.civico
                alone.add(rs.getString(8));  //indirizzo_sped.city
                alone.add(rs.getInt(9));     //indirizzo_sped.cap
                alone.add(rs.getString(10)); // users.email
                
 
                System.out.println("al :: " + alone);
                pid_listone.add(alone);
                
            }
                //Query per spedire ordine //
                String query2 = "SELECT ordini_user.id, ordini_user.data , ordini_user.totale,\r\n" + 
                		"              pagamento.intestatario, pagamento.codice,\r\n" + 
                		"              indirizzo_sped.indirizzo, indirizzo_sped.civico, indirizzo_sped.city, indirizzo_sped.cap,\r\n" + 
                		"              users.email\r\n" + 
                		"              \r\n" + 
                		"  FROM        ordini_user \r\n" + 
                		"  INNER JOIN  pagamento \r\n" + 
                		"  ON          ordini_user.pagamento_id = pagamento.id \r\n" + 
                		"  INNER JOIN  indirizzo_sped \r\n" + 
                		"  ON          ordini_user.indirizzo_sped_id=indirizzo_sped.id\r\n" + 
                		"  INNER JOIN  users\r\n" + 
                		"  ON          indirizzo_sped.users_id=users.id\r\n" + 
                		"  WHERE       ordini_user.status = '2' ORDER BY ordini_user.data DESC;";
                System.out.println("query " + query2);
                st = con.createStatement();
                ResultSet rs2 = st.executeQuery(query2);
     
                while (rs2.next()) {
                    altwo = new ArrayList();

                    altwo.add(rs2.getInt(1));     //ordini_user.id
                    altwo.add(rs2.getString(2));  //ordini_user.data
                    altwo.add(rs2.getString(3));  //ordini_user.totale
                    altwo.add(rs2.getString(4));  //pagamento.intestarario
                    altwo.add(rs2.getString(5));  //pagamento.codice
                    altwo.add(rs2.getString(6));  //indirizzo_sped.indirizzo
                    altwo.add(rs2.getInt(7));     //indirizzo_sped.civico
                    altwo.add(rs2.getString(8));  //indirizzo_sped.city
                    altwo.add(rs2.getInt(9));     //indirizzo_sped.cap
                    altwo.add(rs2.getString(10)); // users.email
                    
     
                    System.out.println("al :: " + altwo);
                    pid_listtwo.add(altwo);
                
            }
                //Query per completare ordine //
                String query3 = "SELECT ordini_user.id, ordini_user.data , ordini_user.totale,\r\n" + 
                		"              pagamento.intestatario, pagamento.codice,\r\n" + 
                		"              indirizzo_sped.indirizzo, indirizzo_sped.civico, indirizzo_sped.city, indirizzo_sped.cap,\r\n" + 
                		"              users.email\r\n" + 
                		"              \r\n" + 
                		"  FROM        ordini_user \r\n" + 
                		"  INNER JOIN  pagamento \r\n" + 
                		"  ON          ordini_user.pagamento_id = pagamento.id \r\n" + 
                		"  INNER JOIN  indirizzo_sped \r\n" + 
                		"  ON          ordini_user.indirizzo_sped_id=indirizzo_sped.id\r\n" + 
                		"  INNER JOIN  users\r\n" + 
                		"  ON          indirizzo_sped.users_id=users.id\r\n" + 
                		"  WHERE       ordini_user.status = '3' ORDER BY ordini_user.data DESC;";
                System.out.println("query " + query3);
                st = con.createStatement();
                ResultSet rs3 = st.executeQuery(query3);
     
                while (rs3.next()) {
                    altre = new ArrayList();

                    altre.add(rs3.getInt(1));     //ordini_user.id
                    altre.add(rs3.getString(2));  //ordini_user.data
                    altre.add(rs3.getString(3));  //ordini_user.totale
                    altre.add(rs3.getString(4));  //pagamento.intestarario
                    altre.add(rs3.getString(5));  //pagamento.codice
                    altre.add(rs3.getString(6));  //indirizzo_sped.indirizzo
                    altre.add(rs3.getInt(7));     //indirizzo_sped.civico
                    altre.add(rs3.getString(8));  //indirizzo_sped.city
                    altre.add(rs3.getInt(9));     //indirizzo_sped.cap
                    altre.add(rs3.getString(10)); // users.email
                    
     
                    System.out.println("al :: " + altre);
                    pid_listtre.add(altre);
                
            }
            	
              //Query per ordini bloccati //
                String query4 = "SELECT ordini_user.id, ordini_user.data , ordini_user.totale,\r\n" + 
                		"              pagamento.intestatario, pagamento.codice,\r\n" + 
                		"              indirizzo_sped.indirizzo, indirizzo_sped.civico, indirizzo_sped.city, indirizzo_sped.cap,\r\n" + 
                		"              users.email\r\n" + 
                		"              \r\n" + 
                		"  FROM        ordini_user \r\n" + 
                		"  INNER JOIN  pagamento \r\n" + 
                		"  ON          ordini_user.pagamento_id = pagamento.id \r\n" + 
                		"  INNER JOIN  indirizzo_sped \r\n" + 
                		"  ON          ordini_user.indirizzo_sped_id=indirizzo_sped.id\r\n" + 
                		"  INNER JOIN  users\r\n" + 
                		"  ON          indirizzo_sped.users_id=users.id\r\n" + 
                		"  WHERE       ordini_user.status = '4' ORDER BY ordini_user.data DESC;";
                System.out.println("query " + query4);
                st = con.createStatement();
                ResultSet rs4 = st.executeQuery(query4);
     
                while (rs4.next()) {
                    alq = new ArrayList();

                    alq.add(rs4.getInt(1));     //ordini_user.id
                    alq.add(rs4.getString(2));  //ordini_user.data
                    alq.add(rs4.getString(3));  //ordini_user.totale
                    alq.add(rs4.getString(4));  //pagamento.intestarario
                    alq.add(rs4.getString(5));  //pagamento.codice
                    alq.add(rs4.getString(6));  //indirizzo_sped.indirizzo
                    alq.add(rs4.getInt(7));     //indirizzo_sped.civico
                    alq.add(rs4.getString(8));  //indirizzo_sped.city
                    alq.add(rs4.getInt(9));     //indirizzo_sped.cap
                    alq.add(rs4.getString(10)); // users.email
                    
     
                    System.out.println("al :: " + alq);
                    pid_listq.add(alq);
                
            }    
              //Query per ordini non andati a buon fine //
                String query5 = "SELECT ordini_user.id, ordini_user.data , ordini_user.totale,\r\n" + 
                		"              pagamento.intestatario, pagamento.codice,\r\n" + 
                		"              indirizzo_sped.indirizzo, indirizzo_sped.civico, indirizzo_sped.city, indirizzo_sped.cap,\r\n" + 
                		"              users.email\r\n" + 
                		"              \r\n" + 
                		"  FROM        ordini_user \r\n" + 
                		"  INNER JOIN  pagamento \r\n" + 
                		"  ON          ordini_user.pagamento_id = pagamento.id \r\n" + 
                		"  INNER JOIN  indirizzo_sped \r\n" + 
                		"  ON          ordini_user.indirizzo_sped_id=indirizzo_sped.id\r\n" + 
                		"  INNER JOIN  users\r\n" + 
                		"  ON          indirizzo_sped.users_id=users.id\r\n" + 
                		"  WHERE       ordini_user.status = '5' ORDER BY ordini_user.data DESC;";
                System.out.println("query " + query5);
                st = con.createStatement();
                ResultSet rs5 = st.executeQuery(query5);
     
                while (rs5.next()) {
                    aln = new ArrayList();

                    aln.add(rs5.getInt(1));     //ordini_user.id
                    aln.add(rs5.getString(2));  //ordini_user.data
                    aln.add(rs5.getString(3));  //ordini_user.totale
                    aln.add(rs5.getString(4));  //pagamento.intestarario
                    aln.add(rs5.getString(5));  //pagamento.codice
                    aln.add(rs5.getString(6));  //indirizzo_sped.indirizzo
                    aln.add(rs5.getInt(7));     //indirizzo_sped.civico
                    aln.add(rs5.getString(8));  //indirizzo_sped.city
                    aln.add(rs5.getInt(9));     //indirizzo_sped.cap
                    aln.add(rs5.getString(10)); // users.email
                    
     
                    System.out.println("al :: " + aln);
                    pid_listn.add(aln);
                
            }    
 
            request.setAttribute("piListc", pid_listone); 
            request.setAttribute("piLists", pid_listtwo); 
            request.setAttribute("piListf", pid_listtre); 
            request.setAttribute("piListq", pid_listq); 
            request.setAttribute("piListn", pid_listn);
            view = request.getRequestDispatcher("amministrazione/amministrazione.jsp");
            con.close();
            System.out.println("Disconnesso!");
        } catch (Exception e) {
            e.printStackTrace();
        }}
        else {
			request.setAttribute("errorMessage", "Sessione scaduta, rieffettua il login, grazie!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
        	}

}

/* SELECT     ordini_user.id, ordini_user.data , ordini_user.totale,
              pagamento.intestatario, pagamento.codice,
              indirizzo_sped.indirizzo, indirizzo_sped.civico, indirizzo_sped.city, indirizzo_sped.cap,
              users.email
              
  FROM        ordini_user 
  INNER JOIN  pagamento 
  ON          ordini_user.pagamento_id = pagamento.id 
  INNER JOIN  indirizzo_sped 
  ON          ordini_user.indirizzo_sped_id=indirizzo_sped.id
  INNER JOIN  users
  ON          indirizzo_sped.users_id=users.id
  WHERE       ordini_user.status = 1 ORDER BY ordini_user.data DESC; */
