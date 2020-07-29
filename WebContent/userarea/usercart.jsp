<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HWBAR</title>
<!-- Stile -->
<link rel="stylesheet" type="text/css"  href="/../HWBAR1/css/stile.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!----------------------------------------------------------->
</head>
<body>
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
    <%if ((session.getAttribute("user")!= null)){%><li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="dropdown">Ciao,<%=session.getAttribute("username")%></a>
    <div class="dropdown-menu dropdown-menu-right">
        <form id="showp" action="<%=request.getContextPath()%>/showp" method="post">
	<a class="dropdown-item" href="javascript:{}" onclick="document.getElementById('showp').submit();">Pannello utente</a>
    </form>
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
  <div class="card-header text-center">
  <h2>Carrello</h2>
  </div>
   <div class="card-body">
  	<div class="card-deck">
  	<div class="container center_div" >
  	<div class="row">
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
<div class="col-12 col-lg-4" style="padding: 15px;">            
<div class="card-wrapper">
  <div class="card">
  <div class="card-header">
  <div class="float-left">
  <form id="<%=pList.get(3) %>f"  action="<%=request.getContextPath()%>/CartdeleteDetails" method="post">
  <input id="<%=pList.get(3) %>c" type="hidden" name="idprodotto" value="<%=pList.get(3) %>">
  <input id="<%=pList.get(3) %>b" name="idcart" type="hidden" value="<%= session.getAttribute("idcart")%>">
  <button id="<%=pList.get(3) %>a" type="submit" class="close" form="<%=pList.get(3) %>f" >&times;</button>
  </form>
  </div>
  <div class="text-center">
  <h5 class="card-title"><%=pList.get(0)%></h5>
  </div>
  </div>
      <div class="card-body text-center">
        <h5 class="card-text"> <%=pList.get(1)%> &euro; al pz.</h5>
         <p class="card-text">Quantit&agrave;: x<%=pList.get(2)%> </p>
        <hr>
          <span class=" float-left">
  		<button id="<%=pList.get(3) %>btpdinfo" type="submit" class="btn btn-info" form="<%=pList.get(3) %>pdinfo" ><svg class="bi bi-info" width="1.3em" height="1.3em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  		<path d="M8.93 6.588l-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588z"/>
  		<circle cx="8" cy="4.5" r="1"/>
  		</svg></button></span>
  		<form id="<%=pList.get(3) %>pdinfo" action="<%=request.getContextPath()%>/productd" method="get" target="_blank">
        <input type="hidden" name="id" value="<%=pList.get(3)%>">
        <input type="hidden" name="pagepoint" value="2">
        </form>
      <div class="btn-group float-right" role="group">
      <button id="<%=pList.get(3) %>a1" type="submit" class="btn btn-success" form="<%=pList.get(3) %>f1" >
      <svg class="bi bi-bag-plus" width="1.3em" height="1.3em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
      <path fill-rule="evenodd" d="M14 5H2v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5zM1 4v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4H1z"/>
      <path d="M8 1.5A2.5 2.5 0 0 0 5.5 4h-1a3.5 3.5 0 1 1 7 0h-1A2.5 2.5 0 0 0 8 1.5z"/>
      <path fill-rule="evenodd" d="M8 7.5a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H6a.5.5 0 0 1 0-1h1.5V8a.5.5 0 0 1 .5-.5z"/>
      <path fill-rule="evenodd" d="M7.5 10a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0v-2z"/>
	  </svg>
      </button>
      <button id="<%=pList.get(3) %>a2" type="submit" class="btn btn-danger" form="<%=pList.get(3) %>f2" >
      <svg class="bi bi-bag-dash" width="1.3em" height="1.3em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  	  <path fill-rule="evenodd" d="M14 5H2v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5zM1 4v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4H1z"/>
  	  <path d="M8 1.5A2.5 2.5 0 0 0 5.5 4h-1a3.5 3.5 0 1 1 7 0h-1A2.5 2.5 0 0 0 8 1.5z"/>
  	  <path fill-rule="evenodd" d="M5.5 10a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H6a.5.5 0 0 1-.5-.5z"/>
	  </svg>
      </button>
      </div>
      </div>
      <div class="card-footer text-right">
      <form id="<%=pList.get(3) %>f1"  action="<%=request.getContextPath()%>/CartsetqntDetails" method="post">
      <input id="<%=pList.get(3) %>c1" type="hidden" name="idprodotto" value="<%=pList.get(3) %>">
      <input id="<%=pList.get(3) %>b1" name="idcart" type="hidden" value="<%= session.getAttribute("idcart")%>">
      </form>
      <form id="<%=pList.get(3) %>f2"  action="<%=request.getContextPath()%>/CartsetqntDetailsm" method="post">
      <input id="<%=pList.get(3) %>c2" type="hidden" name="idprodotto" value="<%=pList.get(3) %>">
      <input id="<%=pList.get(3) %>b2" name="idcart" type="hidden" value="<%= session.getAttribute("idcart")%>">
      </form>
      <%double temptot =(double)pList.get(1) * (int)pList.get(2);
      temptot = temptot * 100; int temptot2 = (int) temptot; double totp = (double) temptot2 / 100;
      %>
      <h5 class="card-text text-right">Totale: <%= totp%> &euro;</h5>
      </div>
    </div>
    </div>
    </div>

                <%
                    }   
                }%>

  </div>
  </div>
  </div>
  </div>

            <%if (countc == 0) {
            %>
         	<div class="card-footer text-muted">
            <h3 class="text-center">Il carrello &egrave; vuoto...</h3>
          	</div>
            <%            }else{
            %>
			<div class="card-footer text-right">
            <h3 class="text-center">TOTALE CARRELLO: <%=totale %> &euro;</h3>
            <form id="precheck" action="<%=request.getContextPath()%>/PreCheck" method="post">
            <input type="hidden" name="id_indirizzo" value="0">
            <input type="hidden" name="id_pagamento" value="0">
            <input type="hidden" name="stato" value="0">
            </form>
            <button type="submit" class="btn btn-success" form="precheck">
            <svg class="bi bi-cart-check" width="1.3em" height="1.3em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  			<path fill-rule="evenodd" d="M11.354 5.646a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708 0z"/>
 			<path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
			</svg> Prosegui con l'acquisto</button>
            </div>
             <%            } %>	
  	             </div>
</div>  
  ${Message}
    		<div class="mobile-margin visible-xs">
  		<footer class="footer">
<nav class="navbar bg-dark navbar-dark">
  <span class="navbar-text">
    Sito a scopo dimostrativo per progetto TSW. Studenti: Federico Pio mat.0512103880 ,  Donato Di Pasquale mat.0512104614.
  </span>
</nav>    
</footer>
</div>
<script>
window.onload = function() {
    var duration = 3000; //2 seconds
    setTimeout(function () { $('#ServletMessage').fadeOut('slow'); }, duration);
};
</script>  
</body>
</html>