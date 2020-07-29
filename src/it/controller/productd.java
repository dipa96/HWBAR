package it.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import it.util.*;
/**
 * Servlet implementation class productd
 */
@WebServlet("/productd")
public class productd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));		
		Connection con;
		PreparedStatement ps;
		Statement st;
		String checkquery = "SELECT * from prodotti WHERE id = '"+id+"'";
		String nome = "" ;
		float prezzo = 0;
		int deposito = 0;
		String pathimg = "" ;
		String descrizione = "" ;
		int tempcheck = 0;
		String pathTrace = request.getHeader("referer");
		PrintWriter out = response.getWriter();
		try {
			con = connessionedb.createConnection();
			int flag = 0;
			ps = con.prepareStatement(checkquery);
			ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 tempcheck=rs.getInt(1);
				 nome=rs.getString(2);
				 prezzo=rs.getFloat(3);
				 deposito=rs.getInt(4);
				 descrizione=rs.getString(5);
				 pathimg=rs.getString(7);
				 if(tempcheck == id) {
				 flag++;
				 }
			 }
			if (flag > 0) {
				System.out.println(pathimg);
				 request.setAttribute("nome", nome);
				 request.setAttribute("prezzo", prezzo);
				 request.setAttribute("deposito", deposito);
				 request.setAttribute("descrizione", descrizione);
				 request.setAttribute("imgpath", pathimg);
				 request.setAttribute("idp", id);
				 request.getRequestDispatcher("/WEB-INF/products.jsp").forward(request, response);
			}else {request.getRequestDispatcher(pathTrace).forward(request, response);}
		}
		catch(Exception e) {e.printStackTrace();}
	}

}
