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
    <%if ((session.getAttribute("user")!= null)){%>
        <li class="nav-item">
        <form id="cartdetails" action="<%=request.getContextPath()%>/CartDetails" method="post">
   		<a class="nav-link" href="javascript:{}" onclick="document.getElementById('cartdetails').submit();">
    	<svg class="bi bi-cart-fill" width="1.5em" height="1.5em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  		<path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
		</svg> &nbsp;</a>
		</form>
	</li>        
    <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="dropdown">Ciao,<%=session.getAttribute("username")%></a>
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
  <button class="tablinks" onclick="openTabs(event, 'Profilo')" id="profile">Profilo</button>
  <button class="tablinks" onclick="openTabs(event, 'Datiaccesso')" id="access">Dati di accesso</button>
  <button class="tablinks" onclick="openTabs(event, 'Indirizzi')" id="address">Indirizzi di spedizione</button>
  <button class="tablinks" onclick="openTabs(event, 'Pagamento')" id="payment">Modalità di pagamento</button>
  <button class="tablinks" onclick="openTabs(event, 'Storyorder')" id="orderstory">Cronologia ordini</button>
  <button class="tablinks" onclick="openTabs(event, 'Assistenza')" id="assistenza">Ticket assistenza</button>
  
    
</div>
</div>
<div class="container-fluid pb-sm-5">
<div id="Profilo" class="tabcontent">
<div class="container center_div">
<div class="alert alert-primary">Qui puoi modificare il tuo profilo, <%=session.getAttribute("user")%></div>
<form action="<%=request.getContextPath()%>/userupdate" method="post" onsubmit="return stopsubmit2(this);">
<input name="id" type="hidden" value="<%= session.getAttribute("id")%>">
<input name="nomeh" type="hidden" value="<%= session.getAttribute("username")%>">
<input name="cognomeh" type="hidden" value="<%= session.getAttribute("cognome")%>">
<input name="indirizzoh" type="hidden" value="<%= session.getAttribute("indirizzo")%>">
<input name="cityh" type="hidden" value="<%= session.getAttribute("city")%>">
<input name="caph" type="hidden" value="<%= session.getAttribute("cap")%>">
<input name="dnascitah" type="hidden" value="<%= session.getAttribute("dnascita")%>">
<input name="ntel1h" type="hidden" value="<%= session.getAttribute("ntel1")%>">
<input name="ntel2h" type="hidden" value="<%= session.getAttribute("ntel2")%>">
<input name="civicoh" type="hidden" value="<%= session.getAttribute("civico")%>">
  <div class="form-row">
    <div class="form-group col-md-4">
      <label>Nome</label><label id="commentNamePrompt"></label>
      <input name="nome" id="commentName" onkeyup="validateName()" type="text" class="form-control" id="" placeholder="<%= session.getAttribute("username")%>" maxlength="45" >
    </div>
    <div class="form-group col-md-4">
      <label>Cognome</label><label id="commentCognomePrompt"></label>
      <input name="cognome" id ="commentCognome" onkeyup="validateCognome()" type="text" class="form-control" id="" placeholder="<%= session.getAttribute("cognome")%>" maxlength="45" >
    </div>
        <div class="form-group col-md-4">
      <label>Data di nascita</label><label id="commentDNascPrompt"></label>
      <input name="dnascita" type="text" class="form-control" id="CommentDnascita" placeholder="<%= session.getAttribute("dnascita")%>" onkeyup="validateDnascita(), this.value=this.value.replace(/^(\d\d)(\d)$/g,'$1/$2').replace(/^(\d\d\/\d\d)(\d+)$/g,'$1/$2').replace(/[^\d\/]/g,'')"  >
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-4">
      <label>Città</label><label id="commentCittaPrompt"></label>
      <input name="city" id="commentCitta" onkeyup="validateCitta()" type="text" class="form-control"  placeholder="<%= session.getAttribute("city")%>" maxlength="45" >
    </div>
 <div  class="form-group col-md-4">
      <label>Indirizzo di residenza</label><label id="commentIndirizzoPrompt"></label>
      <input name="indirizzo" id="commentIndirizzo" onkeyup="validateIndirizzo()" type="text"  class="form-control"  placeholder="<%= session.getAttribute("indirizzo")%>" >
  </div> 
        <div class="form-group col-md-4">
      <label>CAP</label><label id="commentCapPrompt"></label>
      <input name="cap" id="commentCap" onkeyup="validateCap()" type="text" class="form-control"  placeholder="<%= session.getAttribute("cap")%>" maxlength="6" >
    </div>
  </div>
   <div class="form-row">
    <div  class="form-group col-md-12">
      <label>Cellulare</label><label id="commentPhonePrompt"></label>
      <input name="ntel1" id="commentPhone" onkeyup="validatePhone()" type="text" class="form-control"  placeholder="<%= session.getAttribute("ntel1")%>" maxlength="15" >
    </div>
  </div>
  <button type="submit" class="btn btn-primary" value="Registrati">Aggiorna Profilo</button>
  <label id="errorMessage"></label>
</form>

</div>
</div>




<div id="Datiaccesso" class="tabcontent">
<div class="container center_div" style=" padding:15px;">
<div class="alert alert-primary" >Modifica impostazioni d'accesso, <%=session.getAttribute("user")%></div>
<div class="container center_div" style=" padding:15px;">
<form action="<%=request.getContextPath()%>/updatemail" method="post">
<input name="id" type="hidden" value="<%= session.getAttribute("id")%>">
  <div class="form-group">
    <label>Modifica email:</label><label id="commentEmailPrompt"></label>
    <div class="input-group mb-3">
    <input name="mail" type="email" class="form-control" id="commentEmail" onkeyup="validateEmail()" aria-describedby="basic-addon1" placeholder="<%= session.getAttribute("user")%>" maxlength="45" required="required">
  </div>
  </div>
  <button type="submit" class="btn btn-primary">Modifica email </button>
</form>
</div>
<div class="container center_div" style=" padding:15px;">
<form action="<%=request.getContextPath()%>/updatepassword" method="post" onsubmit="return stopsubmit2(this);">
<input name="id" type="hidden" value="<%= session.getAttribute("id")%>">
  <div class="form-group">
    <label>Password</label><label id="commentPassPrompt"></label>
    <div class="input-group mb-3">
    <input id="commentPass" name="password" onkeyup="validatePass()" type="password" class="form-control" aria-describedby="inputGroup-sizing-default" placeholder="Password" maxlength="45" required="required">
    </div>
  </div>
    <div class="form-group">
    <label>Ripeti password</label><label id="commentPass2Prompt"></label>
    <div class="input-group mb-3">
    <input name="rpassword" id="commentPass2" onkeyup="validatePass2()" type="password" class="form-control"  placeholder="Ripeti Password" required="required">
    </div>
  </div>
  <button type="submit" class="btn btn-primary">Modifica password</button>
</form>
</div>
</div>
</div>
<div id="Indirizzi" class="tabcontent">
<div class="container center_div" style=" padding:15px;">
<div class="alert alert-primary" >Modifica i tuoi indirizzi di spedizione (max 3) , <%=session.getAttribute("username")%></div>
</div>
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
      			<h2 class="mb-0">
        		<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse<%=pListi.get(0)%>" aria-expanded="true" aria-controls="collapse<%=pListi.get(0)%>">
         		 <h4 style="text-align:center; text-transform: uppercase;"><%=pListi.get(1)%> <%=pListi.get(2)%></h4>
        		</button>
        		<h4 style="text-align:right"><%=pListi.get(3)%> </h4>
      			</h2>
    			</div>
    			<div id="collapse<%=pListi.get(0)%>" class="collapse" aria-labelledby="heading<%=pListi.get(0)%>" data-parent="#accordion<%=pListi.get(0)%>">
      			<div class="card-body">
      			<div class="btn-group-vertical"  style="float:right">
				<form id="deladd<%=pListi.get(0)%>" action="<%=request.getContextPath()%>/DelAddress" method="post">
				<input type="hidden" name="id_add" value="<%=pListi.get(0)%>">
				</form>
				<span>
				<button id="deladdb<%=pListi.get(0)%>" type="submit" form="deladd<%=pListi.get(0)%>" class="btn btn-danger" style="float:right;"  data-toggle="tooltip" data-placement="right" title="Rimuovi indirizzo">
				<svg class="bi bi-dash-circle-fill" width="1.2em" height="1.2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  				<path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4 7.5a.5.5 0 0 0 0 1h8a.5.5 0 0 0 0-1H4z"/>
				</svg>
				</button>
				</span>
				</div>
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
            <div class="form-group ">
  			<div id="accordion">
  			<div class="card">
    		<div class="card-header text-center" id="headingOne">
      		<h2 class="mb-0">
        	<button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	<h4 class="text-center"> AGGIUNGI NUOVO INDIRIZZO DI SPEDIZIONE</h4>
        	</button>
      		</h2>
    		</div>
    		<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
      		<div class="card-body">
      		<div class="col text-center">
      		<form id="addadr" action="<%=request.getContextPath()%>/AddnewAddress" method="post">
			<div class="form-group">
			<label>Indirizzo:</label>
			<input id="commentIndirizzo" name="indirizzoad" style="text-align:center" class="form-control" type="text" placeholder="inserisci indirizzo" maxlength="45" pattern="[#.0-9a-zA-Z\s,-]{2,45}" required="required">
			</div>
			<div class="form-group">
			<label>Civico:</label>
			<input id="commentIndirizzo" name="civico" style="text-align:center" class="form-control" type="text" placeholder="inserisci indirizzo" maxlength="4" pattern="[#.0-9a-zA-Z\s,-]{2,45}" required="required">
			</div>
      		<div class="form-group">
			<label for="capad">CAP:</label>
			<input id="capad" class="form-control" type="text" style="text-align:center" name="capad" placeholder="xxxxxx"  pattern="[0-9]{5,6}" maxlength="6" required="required">
			</div>
			<div class="form-group">
			<label for="cityad">Citt&agrave;:</label>
			<input id="cityad" class="form-control" type="text"  style="text-align:center" name="cityad" placeholder="inserisci citt&agrave;" maxlength="45" pattern="[A-Za-z\s]{2,45}" required="required">
			</div>
			<div class="form-group">
			<label for="num_tel">Numero associato all'indirizzo:</label>
			<input id="num_tel" class="form-control" type="text" name="num_tel" style="text-align:center" placeholder="inserisci num di telefono" maxlength="10" pattern="[0-9]{10}" required="required">
			</div>
			<div class="form-group">
			<label for="nomead">Chi troviamo a questo indirizzo (nome):</label>
			<input id="nomead" class="form-control" type="text" name="nomead" style="text-align:center" placeholder="Inserisci nome" maxlength="45" pattern="[A-Za-z\s]{2,45}" required="required">
			</div>
			<div class="form-group">
			<label for="cognomead">Chi troviamo a questo indirizzo (cognome):</label>
			<input id="cognomead" class="form-control" type="text" name="cognomead"  style="text-align:center" placeholder="Inserisci cognome" maxlength="45" pattern="[A-Za-z\s]{2,45}" required="required">
			</div>
      		</form>
          	<button type="submit" class="btn btn-primary" style="float:center" form="addadr" ><svg class="bi bi-truck" width="1.3em" height="1.3em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  			<path fill-rule="evenodd" d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5v7h-1v-7a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .5.5v1A1.5 1.5 0 0 1 0 10.5v-7zM4.5 11h6v1h-6v-1z"/>
  			<path fill-rule="evenodd" d="M11 5h2.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5h-1v-1h1a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4.5h-1V5zm-8 8a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
  			<path fill-rule="evenodd" d="M12 13a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 1a2 2 0 1 0 0-4 2 2 0 0 0 0 4z"/>
			</svg> Aggiungi indirizzo</button>
			</div>
			</div>
      		</div>
    		</div>
  			</div>
  			</div>
  			</div>
  </div>
  </div>
  
<div id="Pagamento" class="tabcontent">
<div class="container center_div" style=" padding:15px;">
<div class="alert alert-primary" >Modifica i tuoi metodi di pagamento , <%=session.getAttribute("username")%></div>
</div>
  	 <div class="main" style="float:center">
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
                        String temp = (String) pList.get(2);
                        String term = temp.substring(temp.length() - 4);
            %>
            <div class="container center_div" style=" padding:15px;">
            <div class="form-group ">
                <div class="accordion" id="accordion<%=pList.get(0)%>">
 				 <div class="card">
   				 <div class="card-header" id="heading<%=pList.get(0)%>">
      			<h2 class="mb-0">
        		<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse<%=pList.get(0)%>" aria-expanded="true" aria-controls="collapse<%=pList.get(0)%>">
         		 <h4 style="text-align:center; text-transform: uppercase;"><%=pList.get(1)%></h4>
        		</button>
        		<h4 style="text-align:right">Scadenza: <%=pList.get(4)%></h4>
      			</h2>
    			</div>
    			<div id="collapse<%=pList.get(0)%>" class="collapse" aria-labelledby="heading<%=pList.get(0)%>" data-parent="#accordion<%=pList.get(0)%>">
      			<div class="card-body">
      			<div class="btn-group-vertical"  style="float:right"><span data-toggle="modal" data-target="#updpay<%=pList.get(0)%>">
      			<button type="button" class="btn btn-primary my-1" style="float:right"  data-toggle="tooltip" data-placement="right" title="Modifica"><svg class="bi bi-gear" width="1.2em" height="1.2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  				<path fill-rule="evenodd" d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z"/>
  				<path fill-rule="evenodd" d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z"/>
				</svg></button></span>
				<form id="delpay<%=pList.get(0)%>" action="<%=request.getContextPath()%>/delpayment" method="post">
				<input type="hidden" name="id_pag" value="<%=pList.get(0)%>">
				</form>
				<span>
				<button id="delpayb<%=pList.get(0)%>" type="submit" form="delpay<%=pList.get(0)%>" class="btn btn-danger" style="float:right;"  data-toggle="tooltip" data-placement="right" title="Rimuovi pagamento">
				<svg class="bi bi-dash-circle-fill" width="1.2em" height="1.2em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  				<path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4 7.5a.5.5 0 0 0 0 1h8a.5.5 0 0 0 0-1H4z"/>
				</svg>
				</button>
				</span>
				</div>
				<h4 style="text-align:center">Intestatario carta: <%=pList.get(5)%></h4>
      			<h4 style="text-align:center"> Termina con: <%=term %></h4>
      			<h4 style="text-align:center"> Cvc: <%=pList.get(3)%></h4>
      			</div>
      			</div>
    			</div>
 				</div>
  				</div>
			</div>
			<div class="modal" id="updpay<%=pList.get(0)%>">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Aggiorna metodo di pagamento</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" align="center">
        	<form id="updpayf<%=pList.get(0)%>" action="<%=request.getContextPath()%>/uppayment" method="post">
        	<input id="id<%=pList.get(0)%>" type="hidden" name="id_pagamento" value="<%=pList.get(0)%>">
        	<input id="samen<%=pList.get(0)%>" type="hidden" name="samename" value="<%=pList.get(5)%>">
        	<input id="samed<%=pList.get(0)%>" type="hidden" name="samedate" value="<%=pList.get(4)%>">
        	<div class="form-group">
			<label for="intest<%=pList.get(0)%>">Intestatario della carta:</label>
			<input id="intest<%=pList.get(0)%>" class="form-control" type="text" name="intestatario" pattern="[A-Za-z\s]{2,45}" title="inserisci nome e cognome senza simboli" placeholder="<%=pList.get(5)%>" class="form-group" maxlength="45">
			</div>
			<div class="form-group">
			<label for="scad<%=pList.get(0)%>">Scadenza della carta(mm/aaaa):</label>
			<input id="scad<%=pList.get(0)%>" class="form-control" type="text" name="scad" pattern="[#/0-9]{7,7}" title="mm/aaaa" placeholder="<%=pList.get(4)%>" maxlength="7">
			</div>
            <input id="sub<%=pList.get(0)%>" type="submit" class="btn btn-primary" value="Modifica">
            </form>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
        </div>
        
      </div>
    </div>
  </div>
            <%
                    }
                }
                if (count == 0 && flag == true) {
            %>
         			<div class="container center_div" style=" padding:15px;">
            		<div class="alert alert-warning">
 					 Nessun metodo di pagamento presente. Se vuoi completare gli acquisti aggiungine uno!
					</div>
					</div>
          
            <%            }
            %>	
            <div class="container center_div" style=" padding:15px;">
            <div class="form-group ">
  			<div id="accordion">
  			<div class="card">
    		<div class="card-header text-center" id="headingOne">
      		<h2 class="mb-0">
        	<button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          	<h4 class="text-center"> AGGIUNGI NUOVO METODO</h4>
        	</button>
      		</h2>
    		</div>
    		<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
      		<div class="card-body">
      		<div class="col text-center">
      		<form id="addpay" action="<%=request.getContextPath()%>/Addnewpay" method="post">
      		<div class="form-group">
      		<div class="col-xs-2" align="center">
			<label for="circuito">Selezionare il circuito:</label>
			<select name="circuito" id="circuito" class="form-control" required="required" style="text-align:center; width:auto;">
        	<option selected disabled> ... </option>
       		<option>VISA</option>
        	<option>MASTERCARD</option>
        	<option>POSTEPAY</option>
      		</select>
      		</div>
			</div>
			<div class="form-group">
			<label for="numcard">Numero della carta:</label>
			<input id="numcard" class="form-control" style="text-align:center" type="text" name="numcard"  placeholder="xxxx-xxxx-xxxx-xxxx" maxlength="19" required="required">
			</div>
      		<div class="form-group">
			<label for="cvc">CVC:</label>
			<input id="cvc" class="form-control" style="text-align:center" type="text" name="cvc" placeholder="xxx" maxlength="3" required="required">
			</div>
			<div class="form-group">
			<label for="scadadd">Scadenza della carta:</label>
			<input id="scadadd" class="form-control" style="text-align:center" type="text" name="scadadd" placeholder="mm/aaaa" maxlength="7" required="required">
			</div>
			<div class="form-group">
			<label for="intes">Intestatario della carta:</label>
			<input id="intes" class="form-control" style="text-align:center" type="text" name="intes" placeholder="Inserisci nome e cognome" maxlength="45" required="required">
			</div>
      		</form>
          	<button type="submit" class="btn btn-primary" style="float:center" form="addpay" ><svg class="bi bi-credit-card" width="1.5em" height="1.5em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  			<path fill-rule="evenodd" d="M14 3H2a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z"/>
  			<rect width="3" height="3" x="2" y="9" rx="1"/>
  			<path d="M1 5h14v2H1z"/>
			</svg> Aggiungi metodo</button>
			</div>
			</div>
      		</div>
    		</div>
  			</div>
  			</div>
  			</div>
  </div>
  </div>
  
  <div id="Storyorder" class="tabcontent">
<div class="container center_div" style=" padding:15px;">
<div class="alert alert-primary" >Verifica la tua cronologia ordini, <%=session.getAttribute("user")%></div>
<div class="main" style="float:center">
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Data</th>
      <th scope="col">Intestatario carta</th>
      <th scope="col">Numero carta</th>
      <th scope="col">Indirizzo</th>
      <th scope="col">Stato</th>
      <th scope="col">Totale</th>
	  <th scope="col">Dettagli</th>
    </tr>
  </thead>
  <tbody>
  <%
                int counto = 0;
                String coloro = "#F9EBB3";
                boolean flago = false;
                if (request.getAttribute("piListo") != null) {
                    ArrayList alo = (ArrayList) request.getAttribute("piListo");
                    System.out.println(alo);
                    Iterator itro = alo.iterator();
                    flago = true;
                    while (itro.hasNext()) {
 
                        if ((counto % 2) == 0) {
                            coloro = "#eeffee";
                        }
                        counto++;
                        ArrayList pListo = (ArrayList) itro.next();
                        String tempo = (String) pListo.get(5);
                        String termo = tempo.substring(tempo.length() - 4);
                        int stato = (int)pListo.get(2);
            %>
            
    <tr>
      <th scope="row"><%=pListo.get(1)%></th>
      <td><%=pListo.get(4)%></td>
      <td>Termina con: <%=termo%></td>
      <td><%=pListo.get(6)%> <%=pListo.get(7)%> <%=pListo.get(8)%> (<%=pListo.get(9)%>)</td>
      <td><%if (stato == 1){ %> <p class="text-info"><strong>In attesa di conferma</strong></p>
      <%}else if(stato == 2){ %> <p class="text-primary"><strong>Spedito</strong></p>
      <%}else if (stato == 3){ %> <p class="text-success"><strong>Completato</strong></p>
      <%}else if (stato == 4){ %> <p class="text-warning"><strong>Ordine bloccato</strong></p>
      <%}else if (stato == 5){ %> <p class="text-danger"><strong>Ordine annullato</strong></p><%} %>
      </td>
      <td><%=pListo.get(3)%>&euro;</td>
      <td><button type="submit" class="btn btn-info  btn-sm" id="<%=pListo.get(0) %>b1" form="<%=pListo.get(0) %>f1">Info/Stampa fattura</button></td>
      <form id="<%=pListo.get(0) %>f1" action="<%=request.getContextPath()%>/CartHistory" method="post">
      <input type="hidden" id="<%=pListo.get(0) %>idch" name="idch" value="<%=pListo.get(0) %>">
      <input type="hidden" id="<%=pListo.get(0) %>cartdate" name="cartdate" value="<%=pListo.get(1) %>">
      </form>
    </tr>
    
    <%
                    }
                }
                if (counto == 0 && flago == true) {
            %>
         			<div class="container center_div" style="padding:15px;">
            		<div class="alert alert-warning">
 					 Cronologia acquisto vuota.
					</div>
					</div>
          
            <%            }
            %>	
    </tbody>
    </table>
</div>
</div>
</div> 
<div id="Assistenza" class="tabcontent">
<div class="container center_div" style=" padding:15px;">
<div class="alert alert-primary" >Invia un ticket di Assistenza, <%=session.getAttribute("user")%></div>
<div class="container center_div" style=" padding:15px;">
<form action="<%=request.getContextPath()%>/NewTicket" method="post">
<div class="form-group">
  <label for="usr">Titolo problema:</label>
<input type="text" class="form-control" placeholder="Inserisci un titilo al tuo ticket" name="title" maxlength="48" required>
</div>
<div class="form-group">
  <label for="comment">Descrivi il problema (max 450 caratteri):</label>
  <textarea id="descrizione" class="form-control" rows="5" name="problema" maxlength="449" required></textarea>
  <div class="font-weight-lighter" id="counter"></div>
</div>
<input type="submit" class="btn btn-primary" value="Invia ticket!">
</form>
</div>
</div>
</div>   
  		${Message}
  		<div class="mobile-margin visible-xs">
  		<footer class="footer">
<nav class="navbar  bg-dark navbar-dark">
  <span class="navbar-text">
    Sito a scopo dimostrativo per progetto TSW. Studenti: Federico Pio mat.0512103880 ,  Donato Di Pasquale mat.0512104614.
  </span>
</nav> 
 
</footer>
</div>
<script type="text/javascript" src="/../HWBAR1/js/MaxLength.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#descrizione").MaxLength(
        {
            MaxLength: 450,
            CharacterCountControl: $('#counter')
        });
    });
</script>
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
document.getElementById("profile").click();
</script>
<script>
${reload}
</script>
<script type="text/javascript">
$('#ServletMessage').delay(2500).fadeOut(450);
</script>
<script type="text/javascript" src="js/tooltip"></script>
<script type="text/javascript" src="js/fade_div2"></script>
<script type="text/javascript" src="js/cardnum_ac.js"></script>
<script type="text/javascript" src="js/validationForm/validationprof.js"></script>
<script type="text/javascript" src="js/validationForm/passwd.js"></script>
</body>
</html>