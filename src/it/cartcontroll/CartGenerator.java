package it.cartcontroll;
import it.bean.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.sql.SQLException;
import it.util.connessionedb;

public class CartGenerator {
		OrdiniUser ordiniset = new OrdiniUser();
		int id = 0;
		public String generateCart(LoginBean loginbean) {
		Date date = new Date();  
	    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
	    String strDate = formatter.format(date);  
		Connection con = null;
		Statement statement = null;
		ResultSet rs=null;
		PreparedStatement ps = null;
		OrdiniUser ordiniset = new OrdiniUser();
		
		
		int user_id = loginbean.getIdcostumer();
		int status = 0;
		String tot ="";
		String data="";
		int id_pagamento=0;
		try
        {
        con = connessionedb.createConnection();
		String checkquery = "select * from ordini_user where users_id ='"+user_id+"' AND status = '0';";
		int flag = 0;
		statement = con.createStatement();
		rs=statement.executeQuery(checkquery);
		if(rs.next()) {
		id = rs.getInt("id");
		data = rs.getString("data");
		ordiniset.setData(data);
		status = rs.getInt("status");
		ordiniset.setStatus(status);
		id_pagamento = rs.getInt("pagamento_id");
		ordiniset.setPagamento_id(id_pagamento);
		flag++; return "carrello_caricato";
		}else if (flag <1) {
			String query = "insert into ordini_user values (?,?,?,?,?,?,?);";
			ps=con.prepareStatement(query);
			ps.setString(1,null);
			ps.setString(2,null);
			ps.setString(3,strDate);
			ps.setInt(4, 0);
			ps.setInt(5, user_id);
			ps.setString(6, null);
			ps.setString(7, null);
			int i =ps.executeUpdate();
			if (i>0) {
				rs=statement.executeQuery(checkquery);
				if(rs.next()) {
				id = rs.getInt(1);
				data = rs.getString(3);
				ordiniset.setData(data);
				status = rs.getInt(4);
				ordiniset.setStatus(status);
				id_pagamento = rs.getInt(6);
				ordiniset.setPagamento_id(id_pagamento);
				return "carrello_generato";
				
				}
			}
			
		}
		con.close();
		
        }
		catch(Exception e) {e.printStackTrace();}return "Errore";
	}
	
	public int setidcart () {
		int i = id;
		return i;
	}

}
