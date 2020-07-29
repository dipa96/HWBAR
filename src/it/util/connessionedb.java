package it.util;

import java.sql.Connection;
import java.sql.DriverManager;
 
public class connessionedb {
 public static Connection createConnection()
 {
     Connection con = null;
     try 
     {
         try 
         {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
         } 
         catch (ClassNotFoundException e)
         {
            e.printStackTrace();
         } 
         //con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/db?user=root&password=&serverTimezone=Europe/Rome");
         //con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hwbar2?user=root&password=&serverTimezone=Europe/Rome");
         System.out.println("Printing connection object "+con);
     } 
     catch (Exception e) 
     {
        e.printStackTrace();
     }
     return con; 
 }
}
