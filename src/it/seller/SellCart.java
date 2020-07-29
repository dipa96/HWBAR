package it.seller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import it.util.connessionedb;

public class SellCart {
public String seller(int id_pag , int id_indi, int id_cart, int id_user, String totale) {
	int idpag = id_pag;
	int idindi = id_indi;
	int idcart = id_cart;
	int iduser = id_user;
	String tot = totale;
	Connection con = null;
	Statement st = null;

	try {
		System.out.println(totale);
        con = connessionedb.createConnection();
        String readp = "SELECT prodotti_id , qnt FROM ordini_prodotti WHERE ordini_user_id = '"+idcart+"'";
        st = con.createStatement();
        ResultSet rs = st.executeQuery(readp);
        while (rs.next()) {
        	int nup = rs.getInt(1);
        	int qnt = rs.getInt(2);
        	System.out.println(qnt+ "    " + nup);
        	String readfrmpro = "SELECT deposito FROM prodotti WHERE id = '"+nup+"'";
        	st = con.createStatement();
            ResultSet rs1 = st.executeQuery(readfrmpro);
            while (rs1.next()) {
            	int deppro = rs1.getInt(1);
            	if (deppro > 0) {
            		int finalp = deppro - qnt;
            		System.out.println(finalp);
            		if(finalp >= 0) {
            			try {
            		String updepo = "UPDATE prodotti SET deposito = '"+finalp+"' WHERE id = '"+nup+"'";
                    st = con.createStatement();
                    st.executeUpdate(updepo);}catch(Exception upd) {upd.printStackTrace();}
            		}else return "Not_ok_q_problem";
            	}else return "Not_ok_q_problem";
            }
        }
        String query = "UPDATE ordini_user SET totale = '"+tot+"', status = '1' , pagamento_id = '"+idpag+"' , indirizzo_sped_id = '"+idindi+"' WHERE users_id = '"+iduser+"' AND id = '"+idcart+"'";
        st = con.createStatement();
        st.executeUpdate(query);
        con.close();
		return "Checkout_ok";
	}catch (Exception e) {e.printStackTrace();}
	return "Checkout_ok";

}
}
