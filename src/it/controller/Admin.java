package it.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import it.util.connessionedb;

/**
 * Servlet implementation class Users
 */
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con = null;
        PreparedStatement st;
        HttpSession session = request.getSession(true);
        if(session.getAttribute("ruolo").equals("admin")) {
        try {
            con = connessionedb.createConnection();
            System.out.println("Connected!");   
        	List<String> list = new ArrayList<>();           
            String query = "SELECT 	users.email FROM users WHERE ruolo = 'admin';" ;
            System.out.println("query " + query);
           st = con.prepareStatement(query);
            ResultSet rs = st.executeQuery(query);
 
            while (rs.next()) {
        	    list.add(rs.getString(1));
        	    
        	    
            }
            String json = new Gson().toJson(list);
    	    response.setContentType("application/json");
    	    response.setCharacterEncoding("UTF-8");
    	    response.getWriter().write(json);
            con.close();
            System.out.println("Disconnesso!");
        } catch (Exception e) {
            e.printStackTrace();
        }}}
}