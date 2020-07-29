package it.profilecontroll;

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
 * Servlet implementation class ShowAddress
 */
@WebServlet("/ShowAddress")
public class ShowAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession(true);//Fetch session object
        PrintWriter out = response.getWriter();
        Connection con = null;
        int id = (int)session.getAttribute("id");
        Statement st;
        RequestDispatcher view;
        try {
            con = connessionedb.createConnection();
            System.out.println("Connected!");   
            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
            String query = "SELECT * FROM indirizzo_sped WHERE users_id='"+ id +"' and status = '0'";
            System.out.println("query " + query);
            st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
 
            while (rs.next()) {
                al = new ArrayList();

                al.add(rs.getInt(1));//id
                al.add(rs.getString(3));//indirizzo
                al.add(rs.getInt(10));//civico
                al.add(rs.getString(4));//città
                al.add(rs.getInt(5));//cap
                al.add(rs.getString(6));//num_tel
                al.add(rs.getString(7));//nome
                al.add(rs.getString(8));//cognome

                
 
                System.out.println("al :: " + al);
                pid_list.add(al);
            }
 
            request.setAttribute("piListi", pid_list);
            view = request.getRequestDispatcher("/userarea/profilo.jsp");
            con.close();
            System.out.println("Disconnesso!");
        } catch (Exception e) {
            e.printStackTrace();
        }
        	}
}