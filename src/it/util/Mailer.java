package it.util;
import java.util.Properties;

import javax.mail.*;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  

public class Mailer {

public String send(String to,String subject,String msg){  
  
			final String username = "hwbarproject@gmail.com";
	        final String password = "prG5&Y2.!m";

	        Properties prop = new Properties();
	        prop.put("mail.smtp.user", username);;
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.port", "465");
	        prop.put("mail.smtp.starttls.enable", "true");
	        prop.put("mail.smtp.debug", "true");
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.socketFactory.port", "465");
	        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        prop.put("mail.smtp.socketFactory.fallback", "false");

	        Session session = Session.getInstance(prop,
	                new javax.mail.Authenticator() {
	                    protected PasswordAuthentication getPasswordAuthentication() {
	                        return new PasswordAuthentication(username, password);
	                    }
	                });

	        try {
	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress("hwbarproject@gmail.com"));
	            message.setRecipients(
	                    Message.RecipientType.TO,
	                    InternetAddress.parse(to)
	            );
	            message.setSubject(subject);
	            message.setText(msg+"\r\n"+"Questa mail non riceve posta. Si prega di usare l'apposita sezione nel pannello utente.");
	            Transport.send(message);
	            System.out.println("Email inviata a:"+to);
	            return "inviata";

	        } catch (MessagingException e) {
	            e.printStackTrace(); return "problema";
	        }
	    }


	}