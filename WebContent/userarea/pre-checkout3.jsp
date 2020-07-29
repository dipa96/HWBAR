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
<div class="tab">
  <button class="tablinks" onclick="openTabs(event, 'Indirizzi')" id="adress" disabled>RIVEDI INDIRIZZO</button>
  <button class="tablinks" onclick="openTabs(event, 'Pagamento')" id="payment" disabled>RIVEDI PAGAMENTO</button>
  <button class="tablinks" onclick="openTabs(event, 'Conferma')" id="confirm" >CONFERMA FINALE</button>
</div>
</div>

<div id="Conferma" class="tabcontent">
  	 <div class="main" style="float:center">
<div class="container-sm center_div" style=" padding:15px;">
             <div class="container center_div" style=" padding:15px;">
            <div class="form-group ">
<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-center " type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
          <h4 >INDIRIZZO SCELTO</h4>         
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body text-center">
      <p>Indirizzo: <%=request.getAttribute("indirizzo") %> n. <%=request.getAttribute("civico") %></p>
      <p>Citt&agrave;: <%=request.getAttribute("city") %> / CAP: <%=request.getAttribute("cap") %></p>
      <p>Chi troviamo a questo indirizzo? <%=request.getAttribute("nomeindirizzo") %> <%=request.getAttribute("cognomeindirizzo") %></p>
      <p>Numero telefonico: <%=request.getAttribute("num_tel") %></p>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-center" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <h4 >PAGAMENTO SCELTO</h4>
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body text-center">
      <p>Circuito: <%=request.getAttribute("circuito") %></p>
      <% String temp = (String) request.getAttribute("num_carta");
      String term = temp.substring(temp.length() - 4); %>
      <p>Numero carta che termina con: <%=term %></p>
      <p>Scadenza: <%=request.getAttribute("scad") %></p>
      <p>Intestato a: <%=request.getAttribute("intestatario") %></p>
      <p></p>
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-center" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
          <h4 >CARRELLO</h4>
        </button>
      </h2>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body text-center">
      <table align="center" >
      <tr><th></th><th>Nome:</th><th>Quantit&agrave;:</th><th>Totale:</th><th></th></tr>
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
            <td></td>
                <td><%=pList.get(0)%></td><td> x<%=pList.get(2)%></td><td> <%=(double)pList.get(1) * (int)pList.get(2) %> &euro;</td>
            </tr>
                           <%
                    }
                    
                }%> </table> 
                Totale acquisto <%=totale %> &euro;
      </div>
    </div>
  </div>
</div>
			</div>
  			<div class="card-footer text-right">
            <h4 class="text-center">Vuoi completare l'acquisto?</h4>
            <form id="precheck" action="<%=request.getContextPath()%>/PreCheck" method="post">
            <input type="hidden" name="id_indirizzo" value="0">
            <input type="hidden" name="id_pagamento" value="0">
            <input type="hidden" name="stato" value="3">
            </form>
            <form id="completecheckout" action="<%=request.getContextPath()%>/CompleteCheckout" method="post">
            <input type="hidden" name="id_indirizzo" value="<%=request.getAttribute("id_indirizzo") %>">
            <input type="hidden" name="id_pagamento" value="<%=request.getAttribute("id_pagamento") %>">
            <input type="hidden" name="id_cart" value="<%=session.getAttribute("idcart")%>">
            <input type="hidden" name="totale" value="<%=totale %>">
            </form>
            <button type="submit" class="btn btn-danger" form="precheck">
             Modifica dettagli acquisto</button>
            <button type="submit" class="btn btn-success" form="completecheckout">
            <svg class="bi bi-cart-check" width="1.3em" height="1.3em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  			<path fill-rule="evenodd" d="M11.354 5.646a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708 0z"/>
 			<path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
			</svg> Completa l'acquisto</button>
            </div>

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
    <script>
function openTabs(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("confirm").click();
</script>
<script>
${reload}
</script>  
</body>
</html>