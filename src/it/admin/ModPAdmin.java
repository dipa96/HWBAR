package it.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import it.util.connessionedb;

/**
 * Servlet implementation class ModPAdmin
 */
@WebServlet("/ModPAdmin")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 + 2, // 2 MB
maxFileSize = 1024 * 1024 * 10,  // 10 MB
maxRequestSize = 1024 * 1024 * 50)
public class ModPAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out = response.getWriter();
		Connection con;
		Statement st;
		PreparedStatement ps = null;
		String idpm = request.getParameter("idp");
		String nomem = request.getParameter("nomep");
		String prezzom = request.getParameter("prep");
		String depositom = request.getParameter("depp");
		String descrizionem = request.getParameter("descp");
		String categorie_idcategoriem = request.getParameter("catp");
		
		String nomec = "";
		String prezzoc = "";
		int depositoc = 0;
		String descrizionec = "";
		int categorie_idcategoriec = 0;
		String imgc = null;
		
		 
		
		try {
			int idp = Integer.parseInt(idpm);
			double prezzop = 0.00;
			int depositop = 0;
			int categorie_idcategoriep = 0;
			con = connessionedb.createConnection();
			String checkquery = "select prodotti.nome, prodotti.prezzo, prodotti.deposito, prodotti.descrizione, prodotti.categorie_idcategorie, prodotti.path  from prodotti where id ='"+idp+"';";
			
			ps = con.prepareStatement(checkquery);
			ResultSet rs = ps.executeQuery();
			
			 while(rs.next()) {
				 nomec=rs.getString(1);
				 prezzoc=rs.getString(2);
				 depositoc = rs.getInt(3);
				 descrizionec = rs.getString(4);
				 categorie_idcategoriec = rs.getInt(5);
				 imgc = rs.getString(6);
			 }
			 if (nomem.equals("")) 
			 {nomem=nomec;}
			 
			 if (prezzom.equals("")) 
			 {prezzop=Double.parseDouble(prezzoc);}
			 
			 else if(!prezzom.equals("")) 
			 {prezzop=Double.parseDouble(prezzom);}
			 
			 if (depositom.equals("")) 
			 {depositop=depositoc;}
			 
			 else if(!depositom.equals("")) 
			 {depositop=Integer.parseInt(depositom);}
			 
			 if (descrizionem.equals("")) 
			 {descrizionem=descrizionec;}
			 
			 if (categorie_idcategoriem.equals("")) 	 
			 {categorie_idcategoriep=categorie_idcategoriec;} 
			 
			 else if (!categorie_idcategoriem.equals("")) 
			 {categorie_idcategoriep=Integer.parseInt(categorie_idcategoriem);}
			 
			 
			 
			 String updquery = "UPDATE prodotti SET nome = '"+nomem+"' , prezzo = '"+ prezzop +"', deposito = '"+ depositop +"', descrizione ='"+ descrizionem +"', categorie_idcategorie ='"+ categorie_idcategoriep +"' WHERE id = '"+ idp +"';";
			 st = con.createStatement();
			 st.executeUpdate(updquery);
			 con.close();
	
    request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	"	<div class=\"alert alert-success\" role=\"alert\"> Prodotto modificato con successo! </div>  </div>  "); 
	request.setAttribute("reload", "document.getElementById(\"Modp3\").click();");
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
	dispatcher.forward(request, response);
	}
		
		
		catch (Exception ee) { ee.printStackTrace();} 
		}
	
	
	private String extractFileName(Part part) {
	String contentDisp = part.getHeader("content-disposition");
	String [] items = contentDisp.split(";");
	for (String s : items) {
		if (s.trim().startsWith("filename")) {
			return s.substring(s.indexOf("=") + 2, s.length() - 1);
		}
	}
	return "";
	}
}
