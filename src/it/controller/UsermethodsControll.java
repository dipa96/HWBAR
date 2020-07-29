package it.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import it.util.connessionedb;

public class UsermethodsControll {
	public String MethodsControll(int iduser) {
		Connection con;
		PreparedStatement ps;
		Statement st;
		  try {
				con = connessionedb.createConnection();
				String checkquery ="SELECT * from indirizzo_sped WHERE users_id ='"+iduser+"'AND status ='0'";
				String checkquery1 ="SELECT * from pagamento WHERE users_id ='"+iduser+"'AND status ='0'";
				int flag = 0;
				int flag1 = 0;
				ps = con.prepareStatement(checkquery);
				ResultSet rs = ps.executeQuery();
				 while(rs.next()) {
					 flag++;
				 }
				 ps = con.prepareStatement(checkquery1);
					ResultSet rs1 = ps.executeQuery();
					 while(rs1.next()) {
						 flag1++;
					 }
			if (flag < 1 && flag1 < 1) {
				return "nometodi";
			}else if (flag > 0 && flag1 < 1) {
				return "nopagamento";
			}else if (flag < 1 && flag1 > 0) {
				return "noindirizzo";
			}
			else if (flag > 0 && flag1 > 0) {
				return "okmetodi";
			}
	        }
	        catch(Exception e) {e.printStackTrace();}
		return "";
	}

}
