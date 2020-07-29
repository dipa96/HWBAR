package it.controller;
import it.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.util.connessionedb;
@WebServlet("/search")

public class search extends HttpServlet {
 
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection con = null;
        String pid = request.getParameter("pid");
        PreparedStatement st;
        RequestDispatcher view;
        if (!pid.equals("")) {
        try {
            con = connessionedb.createConnection();
            System.out.println("Connected!");   
            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
            String query = "select prodotti.id, prodotti.nome, prodotti.prezzo,prodotti.deposito,prodotti.descrizione,categorie.nome as categoria,prodotti.path\n" + 
            				"from prodotti\n" + 
            				"inner join categorie\r\n" + 
            				"on prodotti.categorie_idcategorie=categorie.idcategorie\n" + 
            				"where prodotti.nome like '%" + pid + "%' or prodotti.descrizione like '%" + pid + "%' or categorie.nome like '%" + pid + "%' AND prodotti.status = '1'" ;
            System.out.println("query " + query);
           st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery(query);
 
            while (rs.next()) {
                al = new ArrayList();

                al.add(rs.getString(1)); // id
                al.add(rs.getString(2)); // nome
                al.add(rs.getString(3)); // prezzo
                al.add(rs.getString(4)); // deposito
                al.add(rs.getString(5)); //descrizione
                al.add(rs.getString(6)); // categoria
                al.add(rs.getString(7)); // path
                
 
                System.out.println("al :: " + al);
                pid_list.add(al);
            }
 
            request.setAttribute("piList", pid_list);
            view = request.getRequestDispatcher("/searchview.jsp");
            view.forward(request, response);
            con.close();
            System.out.println("Disconnesso!");
        } catch (Exception e) {
            e.printStackTrace();
        }}
        else {
        	request.setAttribute("messages", "Devi digitare un argomento");
        	request.getRequestDispatcher("index.jsp").forward(request, response);}}
    
 
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}