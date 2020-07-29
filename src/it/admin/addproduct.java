package it.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import it.util.connessionedb;

/**
 * Servlet implementation class addproduct
 */
@WebServlet("/addproduct")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 + 2, // 2 MB
			     maxFileSize = 1024 * 1024 * 10,  // 10 MB
			     maxRequestSize = 1024 * 1024 * 50)

public class addproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Connection con = null;
		PreparedStatement ps = null;
		String nome = request.getParameter("nomep");
		String prezzo = request.getParameter("prezzop");
		String deposito = request.getParameter("depositop");
		String descrizione = request.getParameter("descrizionep");
		String categorie_idcategorie = request.getParameter("categorie_idcategoriep");
		char idcat = categorie_idcategorie.charAt(0); int idcatint=Character.getNumericValue(idcat);
		System.out.println(idcat);
		System.out.println(idcatint);
		
		String tempcheck= "";
		
		
		Part part= request.getPart("file");
		String fileName = extractFileName(part);
		String savePath = "inserire path" + File.separator + fileName;
		//File fileSaveDir = new File(savePath);
		String saveontomcat ="/../HWBAR1/imgproduct/";
		
		part.write(savePath + File.separator);
		part.write(saveontomcat);
		savePath = "/../HWBAR1/imgproduct/"+fileName;
        
		
		try {
			double prezzop = Double.parseDouble(prezzo);
			int depositop = Integer.parseInt(deposito);
			con = connessionedb.createConnection();
			String checkquery = "select * from prodotti where nome ='"+nome+"';";
			int flag = 0;
			
			ps = con.prepareStatement(checkquery);
			ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 tempcheck=rs.getString(2);
				 flag++;
			 }
			 if (flag < 1) {
			String query = "insert into prodotti values (?,?,?,?,?,?,?,?);";
			ps = con.prepareStatement(query);
			ps.setString(1, null);
			ps.setString(2, nome);
			ps.setDouble(3, prezzop);
			ps.setInt(4, depositop);
			ps.setString(5, descrizione);
			ps.setInt(6, idcatint);
			ps.setString(7, savePath);
			ps.setInt(8, 1);
			

			int i = ps.executeUpdate();
			if(i>0) {
				out.print("Prodotto aggiunto");
				// request.setAttribute("errMessage", "Registrazione completata!");
				//request.getRequestDispatcher("amministrazione/amministrazione.jsp").forward(request, response);//metodo per post per cambiare pagina
				con.close();
				request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
	             		"	<div class=\"alert alert-success\" role=\"alert\"> Prodotto aggiunto con successo! </div>  </div>  "); 
	             request.setAttribute("reload", "document.getElementById(\"Addp2\").click();");
	             RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showp");
		            dispatcher.forward(request, response);
				System.out.println("Connessione chiusa");
			}
		}else {   
		out.print("Errore registrazione");
		request.setAttribute("errorMessage", "Attenzione, il nome  "+tempcheck+" &egrave; gi&agrave; stata registrato,");
		request.getRequestDispatcher("amministrazione/amministrazione.jsp").forward(request, response);//metodo per post per cambiare pagina
		con.close();
		out.print("Connessione chiusa");  }
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

