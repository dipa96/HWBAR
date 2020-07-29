package it.cartcontroll;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;

import it.util.connessionedb;


public class CartMigration {
	public String Cartmigrate(int idcart, ArrayList cart) {
		Connection con;
		PreparedStatement ps;
		Statement st;
		ArrayList pid_listred = new ArrayList();
        ArrayList pid_list = new ArrayList();
        System.out.println("cart migrator: " +cart);
        if (cart != null) {
        try {
			con = connessionedb.createConnection();
        	Iterator itr1 = cart.iterator();
        	int count = 0;    	
            while (itr1.hasNext()) {
            int flag = 0;
            int qnt = 0;
            ArrayList pList1 = (ArrayList) itr1.next();
            String checkquery ="SELECT * from ordini_prodotti WHERE ordini_user_id ='"+idcart+"'AND prodotti_id ='"+(int)pList1.get(1)+"'";
            ps = con.prepareStatement(checkquery);
			ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 qnt=rs.getInt(3);
				 flag++;
			 }
			 if(flag < 1) {
            String query = "INSERT INTO ordini_prodotti values(?,?,?,?);";
            ps = con.prepareStatement(query);
			ps.setInt(1, idcart);
			ps.setInt(2, (int)pList1.get(1));
			ps.setInt(3, (int)pList1.get(4));
			ps.setDouble(4, (double)pList1.get(3));
			int i = ps.executeUpdate();
			if(i>0) {
				System.out.println("Migrazione oggetto "+pList1.get(2)+" eseguita!");
			}
			 }else if (flag > 0) {
					int qntupdated = (int)pList1.get(4);
					qntupdated = qnt + qntupdated;
					String qntquery="UPDATE ordini_prodotti SET qnt = '"+qntupdated+"' WHERE ordini_user_id ='"+idcart+"'AND prodotti_id ='"+(int)pList1.get(1)+"'";
					st = con.createStatement();
					int i = st.executeUpdate(qntquery);
					if(i>0) {
						System.out.println("Migrazione oggetto "+pList1.get(2)+" eseguita!");
					}
			 }
            }con.close();
        }
        catch(Exception e) {e.printStackTrace();}
        return "Migrazione_completata";}
        else if (cart == null) {
        	return "Niente da migrare";
        }
        return "Errore";
	}
}
