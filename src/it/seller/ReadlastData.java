package it.seller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import it.bean.CheckoutBean;
import it.util.connessionedb;

public class ReadlastData {
	public String ReadData(CheckoutBean checkbean) {
		Connection con = null;
		Statement statement = null;
		ResultSet rs=null;
		ResultSet rs1=null;
		PreparedStatement ps = null;
		int id_pagamento = checkbean.getId_pag();
		int id_indirizzo = checkbean.getId_indi();
		int id_utente = checkbean.getId_user();
		int statolettura = 0;
		try
        {
        con = connessionedb.createConnection();
        String readpagamento = "select * from pagamento where users_id ='"+id_utente+"' AND id = '"+id_pagamento+"';";
        String readindirizzo = "select * from indirizzo_sped where users_id ='"+id_utente+"' AND id = '"+id_indirizzo+"';";
        statement = con.createStatement();
		rs=statement.executeQuery(readpagamento);
		if(rs.next()) {;
			checkbean.setCircuito(rs.getString("circuito"));
			checkbean.setNum_carta(rs.getString("codice"));
			checkbean.setIntestatario_carta(rs.getString("intestatario"));
			checkbean.setScad_carta(rs.getString("scad"));
			statolettura = 1;
		}
        if (statolettura == 1) {
        	statement = con.createStatement();
        	rs1=statement.executeQuery(readindirizzo);
        	if(rs1.next()) {
        		checkbean.setIndirizzo(rs1.getString("indirizzo"));
        		checkbean.setCivico(rs1.getInt("civico"));
        		checkbean.setCity(rs1.getString("city"));
        		checkbean.setCap(rs1.getInt("cap"));
        		checkbean.setIndirizzo_numero(rs1.getString("num_tel"));
        		checkbean.setIndirizzo_nome(rs1.getString("nome"));
        		checkbean.setIndirizzo_cognome(rs1.getString("cognome"));
        	}
        }
        }
		catch(Exception e) {e.printStackTrace();}
	return "Lettura_ok";	
	}
}
