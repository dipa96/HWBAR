package it.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import it.bean.LoginBean;
import it.util.connessionedb;
 
public class LoginDao {
     public String authenticateUser(LoginBean loginBean)
     {
         String email = loginBean.getEmail();
         String password = loginBean.getPassword();

 
         Connection con = null;
         Statement statement = null;
         ResultSet resultSet = null;
         
         String userNameDB = "";
         String passwordDB = "";
         String ruoloDB = "";
         String nome = "";
         String cognome = "";
         int id = 0;
         int cap = 0;
         String city = "";
         String dnascita = "";
         String ntel1 = "";
         String indirizzo ="";

         
         try
         {
             con = connessionedb.createConnection(); 
             statement = con.createStatement(); 
             resultSet = statement.executeQuery("select * from users where email='"+email+"'");  
             while(resultSet.next()) { 
              userNameDB = resultSet.getString("email"); 
              passwordDB = resultSet.getString("password");
              ruoloDB = resultSet.getString("ruolo");
              nome=resultSet.getString("nome");
              cognome=resultSet.getString("cognome");
              id=resultSet.getInt("id");
              indirizzo=resultSet.getString("indirizzo");
              dnascita=resultSet.getString("dnascita");
              ntel1=resultSet.getString("ntel1");
              city=resultSet.getString("city");
              cap=resultSet.getInt("cap");
              
              if(email.equals(userNameDB) && password.equals(passwordDB) && ruoloDB.equals("admin")) {
            	  loginBean.setIdcostumer(id);
            	  loginBean.setRuolo(ruoloDB);
                  return "admin_user";
              }
                  else if(email.equals(userNameDB) && password.equals(passwordDB) && ruoloDB.equals("user")) {
                      loginBean.setNome(nome);
                      loginBean.setEmail(email);
                      loginBean.setCognome(cognome);
                      loginBean.setIdcostumer(id);
                      loginBean.setCap(cap);
                      loginBean.setCity(city);
                      loginBean.setDnascita(dnascita);
                      loginBean.setIndirizzo(indirizzo);
                      loginBean.setNtel1(ntel1);
                      loginBean.setRuolo(ruoloDB);
                	  return "normal_user";
                  }else return "wrong_login";
             }
             con.close();
         }
             catch(SQLException e)
             {
                e.printStackTrace();
             }
             return "Credenziali errate";
         }
     }

