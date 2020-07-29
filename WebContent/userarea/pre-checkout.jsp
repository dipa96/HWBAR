<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<%@ page session="true" %>    
<!DOCTYPE html>
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
  <button class="tablinks" onclick="openTabs(event, 'Indirizzi')" id="adress">RIVEDI INDIRIZZO</button>
  <button class="tablinks" onclick="openTabs(event, 'pagamento')" id="payment" disabled>RIVEDI PAGAMENTO</button>
  <button class="tablinks" onclick="openTabs(event, 'conferma')" id="confirm" disabled>CONFERMA FINALE</button>
</div>
</div>

<div id="Indirizzi" class="tabcontent">
<div class="container center_div" style=" padding:15px;">
<form id="showp" action="<%=request.getContextPath()%>/showp" method="post">
<div class="alert alert-primary" >Seleziona l'indirizzo di spedizione per completare l'ordine, se hai bisogno di aggiungere nuovi indirizzi (max 3) vai sulla <form id="showp" action="<%=request.getContextPath()%>/showp" method="post"><a href="javascript:{}" onclick="document.getElementById('showp').submit();" class="alert-link">pagina del tuo profilo!</a></form></div>
</form>
  	 <div class="main" style="float:center">
  <%
                int counti = 0;
                String colori = "#F9EBB3";
                boolean flagi = false;
                if (request.getAttribute("piListi") != null) {
                    ArrayList ali = (ArrayList) request.getAttribute("piListi");
                    System.out.println(ali);
                    Iterator itri = ali.iterator();
                    flagi = true;
                    while (itri.hasNext()) {
 
                        if ((counti % 2) == 0) {
                            colori = "#eeffee";
                        }
                        counti++;
                        ArrayList pListi = (ArrayList) itri.next();
            %>
            <div class="container center_div" style=" padding:15px;">
            <div class="form-group ">
                <div class="accordion" id="accordion<%=pListi.get(0)%>">
 				 <div class="card">
   				 <div class="card-header" id="heading<%=pListi.get(0)%>">
        		<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse<%=pListi.get(0)%>" aria-expanded="true" aria-controls="collapse<%=pListi.get(0)%>">
         		 <h4 style="text-align:center; text-transform: uppercase;"><%=pListi.get(1)%> <%=pListi.get(2)%></h4>
        		</button>
        		<h4 style="text-align:right"><%=pListi.get(3)%> </h4>
        		<form id="precheck<%=pListi.get(0)%>" action="<%=request.getContextPath()%>/PreCheck" method="post">
        		<input id="<%=pListi.get(0)%>1" type="hidden" name="id_indirizzo" value="<%=pListi.get(0)%>">
        		<input id="<%=pListi.get(0)%>2" type="hidden" name="id_pagamento" value="0">
        		<input id="<%=pListi.get(0)%>3" type="hidden" name="stato" value="1">
        		</form>
        		<button id="<%=pListi.get(0)%>b" type="submit" class="btn btn-success float-right" form="precheck<%=pListi.get(0)%>">
				Seleziona</button>
    			</div>
    			<div id="collapse<%=pListi.get(0)%>" class="collapse" aria-labelledby="heading<%=pListi.get(0)%>" data-parent="#accordion<%=pListi.get(0)%>">
      			<div class="card-body">
				<h5 style="text-align:center">Chi troviamo a questo indirizzo: <%=pListi.get(6)%> <%=pListi.get(7)%></h5>
      			<h5 style="text-align:center"> Numero associato all'indirizzo: <%=pListi.get(5)%></h5>
      			<h5 style="text-align:center"> Indirizzo: <%=pListi.get(1)%> <%=pListi.get(2)%></h5>
      			<h5 style="text-align:center"> Citt&agrave;: <%=pListi.get(3)%></h5>
      			<h5 style="text-align:center"> CAP: <%=pListi.get(4)%></h5>
      			</div>
      			</div>
    			</div>
 				</div>
  				</div>
  				</div>
            <%
                    }
                }
                if (counti == 0 && flagi == true) {
            %>
         			<div class="container center_div" style=" padding:15px;">
            		<div class="alert alert-warning">
 					 Nessun indirizzo di spedizione presente. Se vuoi completare gli acquisti aggiungine uno!
					</div>
					</div>
          
            <%            }
            %>
  			<div class="container center_div" style=" padding:15px;">	

			<br>
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
document.getElementById("adress").click();
</script>
<script>
${reload}
</script>
</body>
</html>