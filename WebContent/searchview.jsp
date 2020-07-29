<%@ page import="java.util.*" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
 
<html>
<head>
<!-- Stile -->
<link rel="stylesheet" type="text/css"  href="/../HWBAR1/css/stile.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!----------------------------------------------------------->
<meta charset="ISO-8859-1">
<title>HWBAR</title>
</head>
    <body>
  <div class="modal" id="myModal3">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Carrello</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" align="center">		
        <table align="center" >
            <tr><th></th><th>Nome:</th><th>Prezzo:</th><th>Quantit&agrave;:</th><th></th></tr> 
  <%
                int countc1 = 0;
                double totale1 = 0.00;
                if (session.getAttribute("ospitecart") != null) {
                    ArrayList al1 = (ArrayList) session.getAttribute("ospitecart");
                    System.out.println(al1);
                    Iterator itr1 = al1.iterator();
                    while (itr1.hasNext()) {
                        countc1++;
                        ArrayList pList1 = (ArrayList) itr1.next();

					double multi = (double)pList1.get(3) * (int)pList1.get(4);
					totale1 = totale1 + multi;
            %>
            
                 <tr>
                <td>
                <form id="<%=pList1.get(1)%>del1" action="<%=request.getContextPath()%>/Ncartdelete" method="post">
                <input type="hidden" id="<%=pList1.get(1)%>del2" name="idpo" value="<%=pList1.get(1)%>">
                </form>
                <button id="<%=pList1.get(1)%>del3" type="submit" class="close" form="<%=pList1.get(1)%>del1" >&times;</button>
                </td>
         		<td> <%=pList1.get(2)%> </td>  
                <td> <%=pList1.get(3)%> &euro;</td>
                <td> x<%=pList1.get(4)%> </td>
                <td>
                <form id="<%=pList1.get(1)%>f1" action="<%=request.getContextPath()%>/NcartsetQnt" method="post">
                <input type="hidden" id="<%=pList1.get(1)%>f3" name="idpo" value="<%=pList1.get(1)%>">
                <input type="hidden" id="<%=pList1.get(1)%>f4" name="mop" value="0">
                </form>
                <button id="<%=pList1.get(1)%>f2" type="submit" class="close" form="<%=pList1.get(1)%>f1" >+</button>
                </td>
                 <td>
                <form id="<%=pList1.get(1)%>c1" action="<%=request.getContextPath()%>/NcartsetQnt" method="post">
                <input type="hidden" id="<%=pList1.get(1)%>c1" name="idpo" value="<%=pList1.get(1)%>">
                <input type="hidden" id="<%=pList1.get(1)%>c1" name="mop" value="1">
                </form>
                <button id="<%=pList1.get(1)%>c1" type="submit" class="close" form="<%=pList1.get(1)%>c1" >-</button>
                </td>
                </tr>
                
            <%
                    }   
                }%>
                <tr>
                <td></td>
                <td>Totale:</td>
                <td><%=totale1 %>&euro;</td>
                </tr>
  	 			</table>
            <%if (countc1 == 0) {
            %>
         
            <b>Il carrello &egrave; vuoto...</b>
          
            <%            }
            %>		
            
  	 <div style="color:red;text-align:center">${errorMessage}</div>
  	 </div>
        
        <!-- Modal footer -->
 		<div class="modal-footer">
        <form id="cartdetails" action="<%=request.getContextPath()%>/CartDetails" method="post">
        </form>
        <button type="submit" class="btn btn-info" form="cartdetails">Dettagli carrello / Procedi all'acquisto</button>
        </div>
        
      </div>
    </div>
  </div>       
             <div class="modal" id="myModal2">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Carrello</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" align="center">		
        <table align="center" >
            <tr><th></th><th>Nome:</th><th>Prezzo:</th><th>Quantit&agrave;:</th><th></th></tr> 
  <%
                int countc = 0;
                String colorc = "#F9EBB3";
                double totale = 0.00;
                if (session.getAttribute("cartList") != null) {
                    ArrayList al = (ArrayList) session.getAttribute("cartList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((countc % 2) == 0) {
                            colorc = "#eeffee";
                        }
                        countc++;
                        ArrayList pList = (ArrayList) itr.next();
                        double totaletemp = (double)pList.get(4) * 100; int totaletemp2 = (int) totaletemp; totale = (double) totaletemp2 / 100;
            %>
            
                 <tr>
                <td><form id="<%=pList.get(3) %>f"  action="<%=request.getContextPath()%>/CartDelete" method="post">
                <input id="<%=pList.get(3) %>c" type="hidden" name="idprodotto" value="<%=pList.get(3) %>">
                <input id="<%=pList.get(3) %>s" type="hidden" name="pgpoint" value="<%= request.getAttribute("pagepoint")%>0">
                <input id="<%=pList.get(3) %>b" name="idcart" type="hidden" value="<%= session.getAttribute("idcart")%>">
                <button id="<%=pList.get(3) %>a" type="submit" class="close" form="<%=pList.get(3) %>f" >&times;</button>
                </form></td>
         		<td> <%=pList.get(0)%> </td>  
                <td> <%=pList.get(1)%> &euro;</td>
                <td> x<%=pList.get(2)%> </td>
                <td><form id="<%=pList.get(3) %>f1"  action="<%=request.getContextPath()%>/CartsetQnt" method="post">
                <input id="<%=pList.get(3) %>c1" type="hidden" name="idprodotto" value="<%=pList.get(3) %>">
                <input id="<%=pList.get(3) %>s1" type="hidden" name="pgpoint" value="<%= request.getAttribute("pagepoint")%>0">
                <input id="<%=pList.get(3) %>b1" name="idcart" type="hidden" value="<%= session.getAttribute("idcart")%>">
                <button id="<%=pList.get(3) %>a1" type="submit" class="close" form="<%=pList.get(3) %>f1" >+</button>
                </form></td>
                 <td><form id="<%=pList.get(3) %>f2"  action="<%=request.getContextPath()%>/CartsetQntm" method="post">
                <input id="<%=pList.get(3) %>c2" type="hidden" name="idprodotto" value="<%=pList.get(3) %>">
                <input id="<%=pList.get(3) %>s2" type="hidden" name="pgpoint" value="<%= request.getAttribute("pagepoint")%>0">
                <input id="<%=pList.get(3) %>b2" name="idcart" type="hidden" value="<%= session.getAttribute("idcart")%>">
                <button id="<%=pList.get(3) %>a2" type="submit" class="close" form="<%=pList.get(3) %>f2" >-</button>
                </form></td>
                </tr>
                
            <%
                    }   
                }%>
                <tr>
                <td></td>
                <td>Totale:</td>
                <td><%=totale %> &euro;</td>
                </tr>
  	 			</table>
            <%if (countc == 0) {
            %>
         
            <b>Il carrello &egrave; vuoto...</b>
          
            <%            }
            %>		
            
  	 <div style="color:red;text-align:center">${errorMessage}</div>
  	 </div>
        
        <!-- Modal footer -->
 		<div class="modal-footer">
        <form id="cartdetails" action="<%=request.getContextPath()%>/CartDetails" method="post">
        </form>
        <button type="submit" class="btn btn-info" form="cartdetails">Dettagli carrello / Procedi all'acquisto</button>
        </div>
        
      </div>
    </div>
  </div>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->

 <span class="navbar-brand mb-0 h1"> <img src="img/logo.png" alt="HWBAR" class="navbar-brand" width="200" height="auto"></span>

  <!-- Links -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
      
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
  <ul class="navbar-nav mr-auto">
    <!--<li class="nav-item">
      <a class="nav-link" href="#">Link 1</a>
    </li>-->
    <!-- Dropdown -->

        <li class="nav-item">
  	<a class="nav-link" href="/../HWBAR1/index.jsp"><svg class="bi bi-house" width="1.5em" height="1.5em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 	  <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
  	  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
	  </svg> Home</a>
      </li>    
    
  </ul>
  <ul class="navbar-nav justify-content-end">
	  <%if((session.getAttribute("user")== null) ){%>
	  	  <li class="nav-item">
	      <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal3"><%= countc1 %>
	       <svg class="bi bi-cart-fill" width="1.5em" height="1.5em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  	<path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
	</svg> &nbsp;</a>
	  </li>
    <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="modal" data-target="#myModal">Accedi o registrati</a>
	</li>
        	<%} %>
   
    <%if ((session.getAttribute("user")!= null)){%>
        <li class="nav-item">
    <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal2"><%=countc %>
    <svg class="bi bi-cart-fill" width="1.5em" height="1.5em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  	<path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
	</svg> &nbsp;</a></li>
    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="dropdown">Ciao,<%=session.getAttribute("username")%></a>
    <div class="dropdown-menu dropdown-menu-right">
    <form id="showp" action="<%=request.getContextPath()%>/showp" method="post">
	<a class="dropdown-item" href="javascript:{}" onclick="document.getElementById('showp').submit();">Pannello utente</a>
    </form>
	<a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal2">Carrello</a>
	<div class="dropdown-divider"></div>
	<form id="logout" action="<%=request.getContextPath()%>/Logout" method="get">
	<a class="dropdown-item"  href="javascript:{}" onclick="document.getElementById('logout').submit();">Logout</a>
	</form>
      </div>
          </li>
      
        	<%} %>
	  <li class="nav-item">
    <form class="form-inline my-2 my-lg-0 " method="get" name="frm" action="<%=request.getContextPath()%>/search">
        <div class="navbar-nav ml-auto">
        <div class="search"> 
		<input  type="text" class="searchTerm" name="pid" id="pid" placeholder="Cerca prodotti..." autocomplete="off">
        <input  type="submit" class="searchButton" name="submit" value="Cerca">
        </div>
        </div>
    	</form>
    	</li>
    	</ul>
  </div>
</nav>

<div class="container center_div" style=" padding:15px;">
 <div class="card">
 <div class="card-body">
  	<div class="card-deck">
  	<div class="container center_div" >
  	<div class="row">
    <%
                int count = 0;
                String color = "#F9EBB3";
                boolean flag = false;
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    flag = true;
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
            %>
            <div class="col-12 col-lg-4" style="padding: 8px;">            
			<div class="card-wrapper">
            <div class="card">
  			<div class="card-header">
  			<div class="text-center">
  			<h5 class="card-title"><%=pList.get(1)%></h5>
  			</div>
  			</div>
  				<div class="card-body text-center">
  				<img class="img-fluid" alt="Nessuna immagina presente" src="<%=pList.get(6) %>" />			
  				<hr>
  			 <h5 class="card-text"> <%=pList.get(2)%> &euro;</h5>
  			 </div>
  			 </div>
  			 <div class="card-footer text-right">
  			 <span>
             <button id="<%=pList.get(0) %>btpdinfo" type="submit" class="btn btn-primary" form="<%=pList.get(0) %>pdinfo" ><svg class="bi bi-info" width="1.5em" height="1.5em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			 <path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z"/>
			 <circle cx="8" cy="4.5" r="1"/>
			 </svg> Dettagli</button></span>
             <form id="<%=pList.get(0) %>pdinfo" action="<%=request.getContextPath()%>/productd" method="get" target="_blank">
             <input type="hidden" name="id" value="<%=pList.get(0)%>">
             <input type="hidden" name="pagepoint" value="1">
             </form>
  			 </div>
    		 </div>
    		 </div>
    		<!--   </div> -->
    		 <%
                    }
                } %>
    		   </div>
  </div>
  </div>
  </div>
            
                <%        
                if (count == 0 && flag == true) {
            %>
         <div class="container center_div" >
            <div class="alert alert-dark" role="alert">
            La ricerca non ha dato risultati purtroppo.
            </div>
          </div>
            <%            }
            %>

        </div>
        </div>
            

            
        
      <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Login</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" align="center">
          	<form name="form" action="<%=request.getContextPath()%>/LoginServlet" method="post">
	<table align="center">
    <tr>
  	<td>
	<input  type="text" name="email" placeholder="Email"/>
	</td>
	</tr>
	<tr>
	<td>
	<input  type="password" name="password" placeholder="Password"/>
	</td>
	</tr>
	<tr>
	<td>
	<input  type="submit" value="Login">
	</td>
	</tr>
	<tr>
	<td>
	<a class="dropdown-item" href="register.jsp">Oppure registrati</a>
	</td>
	</tr>
	</table>
	</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
        </div>
        
      </div>
    </div>
  </div>      
    		<div class="mobile-margin visible-xs">
  		<footer class="footer">
<nav class="navbar bg-dark navbar-dark">
  <span class="navbar-text">
    Sito a scopo dimostrativo per progetto TSW. Studenti: Federico Pio mat.0512103880 ,  Donato Di Pasquale mat.0512104614.
  </span>
</nav>    
</footer>
</div>
<script>$(document).ready(function() {

	  if(window.location.href.indexOf('#myModal2') != -1) {
	    $('#myModal2').modal('show');
	  }

	});</script>
    </body>
</html>