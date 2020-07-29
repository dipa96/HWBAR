package it.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.util.connessionedb;

/**
 * Servlet implementation class RegisterAdmin
 */
@WebServlet("/RegisterAdmin")
public class RegisterAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter out = response.getWriter();
	Connection con = null;
	PreparedStatement ps = null;
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String ruolo="admin";
	String tempcheck= "";
	
	
	try {
		
		con = connessionedb.createConnection();
		String checkquery = "select * from users where email ='"+email+"';";
		int flag = 0;
		
		ps = con.prepareStatement(checkquery);
		ResultSet rs = ps.executeQuery();
		 if(rs.next()) {
			 tempcheck=rs.getString(2);
			 flag++;
		 }
		 if (flag < 1) {
		String query = "insert into users values (?,?,?,?,?,?,?,?,?,?,?);";
		ps = con.prepareStatement(query);
		ps.setString(1, null);
		ps.setString(2, email);
		ps.setString(3, "nome_admin");
		ps.setString(4, "cognome_admin");
		ps.setString(5, "indirizzo_admin");
		ps.setString(6, "dnasc_admin");
		ps.setString(7, "city_admin");
		ps.setInt(8, 0000);
		ps.setString(9, "cell_admin");
		ps.setString(10, password);
		ps.setString(11, ruolo);
		int i = ps.executeUpdate();
		if(i>0) {
			System.out.println("Registrazione effettuata");
			request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
		     		"	<div class=\"alert alert-success\" role=\"alert\"> Registrazione admin completata! </div>  </div>  ");
			request.setAttribute("reload", "document.getElementById(\"AddAdmin10\").click();");
			request.getRequestDispatcher("amministrazione/amministrazione.jsp").forward(request, response);//metodo per post per cambiare pagina
			con.close();
			System.out.println("Connessione chiusa");
		}
	}else {   
	out.print("Errore registrazione");
	request.setAttribute("Message", "<div id=\"ServletMessage\" class=\"container center_div\" style=\" padding:15px;\">\n" + 
     		"	<div class=\"alert alert-danger\" role=\"alert\"> Attenzione, la mail che hai inserito &egrave; gi&agrave; esistente! </div>  </div>  ");
	request.setAttribute("reload", "document.getElementById(\"AddAdmin10\").click();");
	request.getRequestDispatcher("amministrazione/amministrazione.jsp").forward(request, response);//metodo per post per cambiare pagina
	con.close();
	out.print("Connessione chiusa");  }
	}
	catch (Exception ee) { ee.printStackTrace();}	
	}

}
