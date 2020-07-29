<%@page import="it.bean.LoginBean"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<%@ page import="it.bean.LoginBean" %>
<meta charset="ISO-8859-1">
<title>HWBAR</title>
<!-- Stile -->
<link rel="stylesheet" type="text/css"  href="css/stile.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js"></script>

<!----------------------------------------------------------->
</head>
<body class="bg-light">
<%int countc = 0; %>
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

 <span class="navbar-brand mb-0 h3"> <img src="img/logo.png" alt="HWBAR" class="navbar-brand" width="200" height="auto"></span>

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
  <ul class="navbar-nav justify-content-end pull-left">
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
    <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal2"><%= countc %>
    <svg class="bi bi-cart-fill" width="1.5em" height="1.5em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  	<path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
	</svg> &nbsp;</a></li>
    <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="dropdown">Ciao,<%=session.getAttribute("username")%></a>
    <div class="dropdown-menu dropdown-menu-right">
    
    
    
    <form id="showp" action="<%=request.getContextPath()%>/showp" method="post">
    <%if ((session.getAttribute("ruolo").equals("user"))){%>
	<a class="dropdown-item" href="javascript:{}" onclick="document.getElementById('showp').submit();">Pannello utente</a>
	<%}else if ((session.getAttribute("ruolo").equals("admin"))){ %>
	<a class="dropdown-item" href="javascript:{}" onclick="document.getElementById('showp').submit();">Pannello admin</a>
	<%} %>
    </form>
    
    
	<a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModal2">Carrello</a>
	<div class="dropdown-divider"></div>
	<form id="logout" action="<%=request.getContextPath()%>/Logout" method="get">
	<a class="dropdown-item"  href="javascript:{}" onclick="document.getElementById('logout').submit();">Logout</a>
	</form>
      </div>
          </li>
      
        	<%} %>
    	</ul>
  </div>

</nav>

<div class="container center_div" style="padding:5px;" >
 <div class="card">
 <div class="card-body">
<div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active" data-interval="8000">
      <img class=carosel src="/../HWBAR1/img/slide6.png" class="d-block w-100" alt="Progetto">
 	 <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <img src="/../HWBAR1/img/slide4.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Tutto ci&ograve; che ti serve</h5>
        <p>HWBAR all'avanguardia per quanto riguarda le novit&agrave;!</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="/../HWBAR1/img/slide1.jpg" class="d-block w-100" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <h5>Migliaia di centri in tutto il mondo (FINTO)</h5>
        <p>Oltre a trovarci online, ci trovi in migliaia di centri sparsi per il mondo.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Indietro</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Avanti</span>
  </a>
</div>
</div>
</div>
</div>
<div class="container center_div" style="padding:10px;">
  		<form method="get" name="frm" action="<%=request.getContextPath()%>/search">
        <div class="search"> 
		<input  type="text" style="text-align:center" class="searchTerm" name="pid" id="pid" onkeyup="showData(this.value);" placeholder="Cerca prodotti..." autocomplete="off">
        <input  type="submit" class="searchButton" name="submit" value="Cerca">
        </div>
    	</form>
    	</div> 
<div class="container center_div" style="padding:5px;" >
 <div class="card">
 <div class="card-body">
<nav aria-label="breadcrumb ">
  <ol class="breadcrumb bg-dark">
    <li class="breadcrumb-item active text-light" aria-current="page"><strong>Shop per categoria</strong></li>
  </ol>
</nav>
<div class="container">
    <div class="row">
        <div class="col-xs-6 col-md-4">
        <div class="list-group">
  <div class="list-group-item bg-dark text-light">
    Componenti Hardware
  </div>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat1"><input name="pid" type="hidden" value="1"> <a class="list-group-item list-group-item-action" href="javascript:{}"onclick="document.getElementById('cat1').submit();">Schede Madre</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat2"><input name="pid" type="hidden" value="2"> <a class="list-group-item list-group-item-action" href="javascript:{}"onclick="document.getElementById('cat2').submit();">CPU</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat3"><input name="pid" type="hidden" value="3"> <a class="list-group-item list-group-item-action" href="javascript:{}"onclick="document.getElementById('cat3').submit();">RAM</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat4"><input name="pid" type="hidden" value="4"> <a class="list-group-item list-group-item-action" href="javascript:{}"onclick="document.getElementById('cat4').submit();">GPU</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Dissipatori e Fans</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Alimentatori</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Case</a></form>
</div>
  <div class="list-group pt-sm-4 pt-4">
  <div class="list-group-item bg-dark text-light">
    Periferiche esterne
  </div>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Monitor</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Tastiera</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Mouse</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Stampanti e scanner</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Dispositivi usb</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Archiviazione esterna</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Cavi</a></form>
</div>
        </div>
        <div class="col-xs-6 col-md-4">
        <div class="list-group pt-4 pt-sm-0">
  <div class="list-group-item bg-dark text-light">
    Portatili
  </div>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat5"><input name="pid" type="hidden" value="5"> <a class="list-group-item list-group-item-action" href="javascript:{}"onclick="document.getElementById('cat5').submit();">Gaming</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat6"><input name="pid" type="hidden" value="6"> <a class="list-group-item list-group-item-action" href="javascript:{}"onclick="document.getElementById('cat6').submit();">Ufficio</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat7"><input name="pid" type="hidden" value="7"> <a class="list-group-item list-group-item-action" href="javascript:{}"onclick="document.getElementById('cat7').submit();">Ultrabook</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat8"><input name="pid" type="hidden" value="8"> <a class="list-group-item list-group-item-action" href="javascript:{}"onclick="document.getElementById('cat8').submit();">Apple</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Borse e zaini</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled " href="javascript:{}"onclick="document.getElementById('cat0').submit();">Piattaforme di raffreddamento</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled " href="javascript:{}"onclick="document.getElementById('cat0').submit();">Cover</a></form>
</div>
        <div class="list-group pt-4">
  <div class="list-group-item bg-dark text-light">
    Pre-assemblati
  </div>
  <a href="#" class="list-group-item list-group-item-action disabled">Video-editing</a>
  <a href="#" class="list-group-item list-group-item-action disabled">Gaming</a>
  <a href="#" class="list-group-item list-group-item-action disabled">Ufficio</a>
  <a href="#" class="list-group-item list-group-item-action disabled">Home</a>
  <a href="#" class="list-group-item list-group-item-action disabled">Personalizzati</a>
  <a href="#" class="list-group-item list-group-item-action disabled">School</a>
  <a href="#" class="list-group-item list-group-item-action disabled">Mini</a>
</div>
        </div>
        <div class="col-xs-6 col-md-4">
        <div class="list-group pt-4 pt-sm-0">
  <div class="list-group-item bg-dark text-light">
    Ufficio
  </div>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat9"><input name="pid" type="hidden" value="9"> <a class="list-group-item list-group-item-action " href="javascript:{}"onclick="document.getElementById('cat9').submit();">Scrivania</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat10"><input name="pid" type="hidden" value="10"> <a class="list-group-item list-group-item-action " href="javascript:{}"onclick="document.getElementById('cat10').submit();">Sedia</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat11"><input name="pid" type="hidden" value="11"> <a class="list-group-item list-group-item-action " href="javascript:{}"onclick="document.getElementById('cat11').submit();">Mini frigo</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat12"><input name="pid" type="hidden" value="12"> <a class="list-group-item list-group-item-action " href="javascript:{}"onclick="document.getElementById('cat12').submit();">Lampada</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled" href="javascript:{}"onclick="document.getElementById('cat0').submit();">Canalina filo</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled " href="javascript:{}"onclick="document.getElementById('cat0').submit();">Staffe</a></form>
  <form action="<%=request.getContextPath()%>/Searchcat" method="get" id="cat"><input name="pid" type="hidden" value="0"> <a class="list-group-item list-group-item-action disabled " href="javascript:{}"onclick="document.getElementById('cat0').submit();">Portapenne / portaoggetti</a></form>
</div>
        <div class="list-group pt-4">
  <div class="list-group-item bg-dark text-light">
    Software
  </div>
  <a href="#" class="list-group-item list-group-item-action disabled">Sistema Operativo</a>
  <a href="#" class="list-group-item list-group-item-action disabled">Antivirus</a>
  <a href="#" class="list-group-item list-group-item-action disabled">Cad</a>
  <a href="#" class="list-group-item list-group-item-action disabled">Video editor</a>
  <a href="#" class="list-group-item list-group-item-action disabled">Audio Editor</a>
  <a href="#" class="list-group-item list-group-item-action disabled">Video-Games</a>
  <a href="#" class="list-group-item list-group-item-action disabled">Istruzione</a>
</div>
        </div>
    </div>
</div>
</div>
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
	<input  type="text" class="form-control" name="email" placeholder="Email"/>
	</td>
	</tr>
	<tr>
	<td>
	<input  type="password" class="form-control" name="password" placeholder="Password"/>
	</td>
	</tr>
	<tr>
	<td>
	<input  type="submit" class="btn btn-primary" value="Login">
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
  
  <div class="modal" id="ServletMessagem">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">${Messaget}</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" align="center">
          ${Message}
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

	});
</script>
<script>
${Messagemodal}
</script>
<script>
$('#ServletMessagem').delay(4500).fadeOut(450);

setTimeout(function(){
   $('#ServletMessagem').modal("hide");
}, 5000);
</script>	
</body>
</html>