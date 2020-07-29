<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<%@ page session="true" %>
<html>
<head>
<!-- Stile -->
<link rel="stylesheet" type="text/css"  href="/../HWBAR1/css/stile.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="js/ajax/usersreg.js" type="text/javascript"></script>

<script>
$(document).on("click", "#users", function() {  
    $.get("Users", function(responseJson) { 
    	$("#users").attr("disabled", true);//
        var $ol = $("<ol>").appendTo($("#userdiv")); 
        $.each(responseJson, function(index, item) { 
            $("<li>").text(item).appendTo($ol);      
        });
    });
});
</script>
<script>
$(document).on("click", "#admin", function() {
    $.get("Admin", function(responseJson) {
    	$("#admin").attr("disabled", true);
        var $ol = $("<ol>").appendTo($("#admindiv")); 
        $.each(responseJson, function(index, item) { 
            $("<li>").text(item).appendTo($ol);      
        });
    });
});
</script>

<script>
$(document).on("click", "#drop", function() {  
    $.get("Dropcat", function(responseJson) {
    	document.getElementById("drop").style.visibility = "hidden";
        var $select = $("<select name='categorie_idcategoriep' multiple class='form-control'>").appendTo($("#dropcatdiv")); 
        $.each(responseJson, function(index, item, item2) { 
            $("<option>").text(item).appendTo($select);      
        });
    });
});
</script>
<!----------------------------------------------------------->
<meta charset="ISO-8859-1">
<title>HwBar Admin Panel</title>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->

 <span class="navbar-brand mb-0 h3"> <img src="img/logo.png" alt="HWBAR" class="navbar-brand" width="200" height="auto"></span>

  <!-- Links -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
      
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
  <ul class="navbar-nav mr-auto">
  
        <li class="nav-item">
  	<a class="nav-link" href="/../HWBAR1/index.jsp"><svg class="bi bi-house" width="1.5em" height="1.5em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 	  <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
  	  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
	  </svg> Home</a>
      </li>    
    
  </ul>
  <ul class="navbar-nav justify-content-end pull-left">
     
    <%if ((session.getAttribute("user")!= null)){%>
    <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbardrop2" data-toggle="dropdown">Ciao,<%=session.getAttribute("username")%></a>
    <div class="dropdown-menu dropdown-menu-right">
	<form id="logout" action="<%=request.getContextPath()%>/Logout" method="get">
	<a class="dropdown-item"  href="javascript:{}" onclick="document.getElementById('logout').submit();">Logout</a>
	</form>
      </div>
          </li>
      
        	<%} %>
    	</ul>
  </div>

</nav>

<h1 style="background-color:#343A40; color:#ffffff; border-top-color:white;border-top-style:groove;" align="center">Pannello amministrazione HWBAR </h1>
<div class="container center_div">
<div class="tab">
  <button class="tablinks" onclick="openTabs(event, 'Panel')" id="Panel1">Pannello Amministrativo</button>
  <button class="tablinks" onclick="openTabs(event, 'Addp')"  id="Addp2">Aggiungi prodotto</button>
  <button class="tablinks" onclick="openTabs(event, 'Modp')"  id="Modp3">Modifica prodotto</button>
  <button class="tablinks" onclick="openTabs(event, 'AOrd')"  id="AOrd5">Ordini da confermare</button>
  <button class="tablinks" onclick="openTabs(event, 'SOrd')"  id="SOrd6">Spedizione in corso</button>
  <button class="tablinks" onclick="openTabs(event,'ComOrd')" id="ComOrd7">Ordini completati</button>
  <button class="tablinks" onclick="openTabs(event,'BlockOrd')" id="BlockOrd8">Ordini bloccati</button>
  <button class="tablinks" onclick="openTabs(event,'DelOrd')" id="DelOrd9">Ordini annullati</button>
  <button class="tablinks" onclick="openTabs(event, 'AddAdmin')" id="AddAdmin10">Aggiungi Admin</button>
  <button class="tablinks" onclick="openTabs(event, 'Ass')" id="Ass11">Assistenza</button> 
</div>
</div>
<div class="container center_div">
<div id="Panel" class="tabcontent" style="background-color:#343A40">
  <h3 style="color:#ffffff;">Benvenuto nel pannello amministrativo , <%= session.getAttribute("user")%>!</h3>
  <button class="pbutton" onclick="openTabs(event, 'Addp')"  id="Addp2">Aggiungere prodotti</button>
  <button class="pbutton" onclick="openTabs(event, 'Modp')"  id="Modp3">Modificare prodotti</button>
  <button class="pbutton" onclick="openTabs(event, 'AOrd')"  id="AOrd5">Gestire gli ordini degli utenti</button>
  <button class="pbutton" onclick="openTabs(event, 'Ass')"   id="Ass11">Dare assistenza ai clienti</button> 
  
  <h3 style="color:white">Alcune informazioni...</h3>
  <hr class="linea">
  <button class="pbutton" id="users">Clicca qui per vedere gli utenti registrati</button>
  <div id="userdiv"></div>
  <hr class="linea">
  <button class="pbutton "id="admin">Clicca qui per vedere il team di HWBAR!</button>
  <div id="admindiv"></div>
  <hr class="linea">
  
  </div>
  
  
</div>
<div id="Addp" class="tabcontent">
<div class="container center_div">
  <div class="alert alert-primary" role="alert">
  Da questa sezione puoi aggiungere prodotti.
</div>
 <form id="Addproduct" action="<%=request.getContextPath()%>/addproduct" method="post" enctype="multipart/form-data">
			<div class="form-group">
			<label>Nome:</label>
			<input id="Nomeprodotto" name="nomep" style="text-align:center" class="form-control" type="text" placeholder="Inserisci nome prodotto" maxlength="45"  required="required">
			</div>
			<div class="form-group">
			<label>Prezzo:</label>
			<input id="Prezzoprodotto" name="prezzop" style="text-align:center" class="form-control" type="text" placeholder="Inserisci prezzo" maxlength="45"  required="required">
			</div>
      		<div class="form-group">
			<label>Deposito:</label>
			<input id="Depositoprodotto" name="depositop" class="form-control" type="text" style="text-align:center"  placeholder="Inserisci numero in deposito"   maxlength="45" required="required">
			</div>
			<div class="form-group">
			<label for="cityad">Descrizione:</label>
			<input id="cityad" name="descrizionep" class="form-control" type="text"  style="text-align:center"  placeholder="inserisci descrizione;" maxlength="45"  required="required">
			</div>
			<div class="form-group">
			
		<div id="dropcatdiv"></div>	
		<button id="drop" class="btn btn-success"type="button">Seleziona categoria</button>
		
		 
		 
		 
		 
			</div>
			<div class="form-group">
			<label for="nomead">Upload immagine:</label>
			<input id="nomead" name="file" class="form-control" type="file"  style="text-align:center" placeholder="Inserisci img" maxlength="45"  required="required">
			</div>
		<input type="submit" class="btn btn-primary" value="Inserisci un prodotto!">
      		</form>
      		
</div>  		
</div>

<div id="Modp" class="tabcontent">
  <div class="container center_div">
  <div class="alert alert-primary" role="alert">
  Da questa sezione puoi modificare i prodotti in vendita.
</div>
<div style="overflow-x:auto;">
  <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Nome</th>
      <th scope="col">Prezzo</th>
      <th scope="col">Deposito</th>
      <th scope="col">Descrizione</th>
      <th scope="col">Categoria</th>
      <th scope="col">Info</th>
      <th scope="col">Modifica</th>
      <th scope="col">Elmina</th>
    </tr>
  </thead>
  <tbody>
  <%
                int countp = 0;
                String colorp = "#F9EBB3";
                boolean flagp = false;
                if (request.getAttribute("piListp") != null) {
                    ArrayList alp = (ArrayList) request.getAttribute("piListp");
                    System.out.println(alp);
                    Iterator itrp = alp.iterator();
                    flagp = true;
                    while (itrp.hasNext()) {
 
                        if ((countp % 2) == 0) {
                            colorp = "#eeffee";
                        }
                        countp++;
                        ArrayList pListp = (ArrayList) itrp.next();
                        
            %>
    <tr>   
      <th scope="row">
<form id="<%=pListp.get(0) %>f14" action="<%=request.getContextPath()%>/ModPAdmin" method="post" enctype="multipart/form-data">
      <input name="idp" type="hidden" id="<%=pListp.get(0) %>idp"  value="<%=pListp.get(0) %>">
      <input name="nomep"class="form-control" type="text" placeholder="<%=pListp.get(1)%>"></th>
      <td><input name="prep" class="form-control" type="text" placeholder="<%=pListp.get(2)%>"></td>
      <td><input name="depp" class="form-control" type="text" placeholder="<%=pListp.get(3)%>"></td>
      <td><input name="descp"class="form-control" type="text" placeholder="<%=pListp.get(4)%>"></td>
      <td><select name="catp" class="form-control">
    	 <option value="<%=pListp.get(5)%>" selected><%=pListp.get(6)%></option>
    	 <option value="1">Scheda Madre</option>
      	 <option value="2">CPU</option>
	  	 <option value="3">RAM</option>
	  	 <option value="4">GPU</option>
	  	 <option value="5">Gaming</option>     
      </select></td>
      </form>
      
      
      <!-- Visualizza Prodotto -->
      <td><button type="submit" class="btn btn-primary  btn-sm" id="<%=pListp.get(0) %>b13" form="<%=pListp.get(0) %>f13">Info</button></td>
      <form id="<%=pListp.get(0) %>f13" action="<%=request.getContextPath()%>/productd" method="get" target="_blank">
      <input type="hidden" id="<%=pListp.get(0) %>idp" name="id" value="<%=pListp.get(0) %>">
      </form>
      
      <!-- Modifica prodotto  -->
       <td><button type="submit" class="btn btn-success  btn-sm" id="<%=pListp.get(0) %>b14" form="<%=pListp.get(0) %>f14">Modifica</button></td>
      
      <!-- Elimina prodotto -->
       <td><button type="submit" class="btn btn-danger  btn-sm" id="<%=pListp.get(0) %>b15" form="<%=pListp.get(0) %>f15">Elimina</button></td>
      <form id="<%=pListp.get(0) %>f15" action="<%=request.getContextPath()%>/DelProduct" method="post">
      <input type="hidden" id="<%=pListp.get(0) %>idp" name="idp" value="<%=pListp.get(0) %>">
      </form>
    </tr>
    
    <%
                    }
                }
                if (countp == 0 && flagp == true) {
            %>
         			<div class="container center_div" style="padding:15px;">
            		<div class="alert alert-warning">
 					 Nessun prodotto presente.
					</div>
					</div>
          
            <%            }
            %>	
    </tbody>
    </table>
    </div>
    </div> 
</div>

<div id="AOrd" class="tabcontent">
<div class="container center_div">
  <div class="alert alert-primary" role="alert">
  Da questa sezione puoi confermare gli ordini degli utenti.
</div>
  <div style="overflow-x:auto;">
  <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Data</th>
      <th scope="col">Intestatario carta</th>
      <th scope="col">Numero carta</th>
      <th scope="col">Indirizzo</th>
      <th scope="col">Utente</th>
      <th scope="col">Totale</th>
	  <th scope="col">Dettagli</th>
	  <th scope="col">Spedisci</th>
	  <th scope="col">Blocca</th>
    </tr>
  </thead>
  <tbody>
  <%
                int countc = 0;
                String colorc = "#F9EBB3";
                boolean flagc = false;
                if (request.getAttribute("piListc") != null) {
                    ArrayList alc = (ArrayList) request.getAttribute("piListc");
                    System.out.println(alc);
                    Iterator itrc = alc.iterator();
                    flagc = true;
                    while (itrc.hasNext()) {
 
                        if ((countc % 2) == 0) {
                            colorc = "#eeffee";
                        }
                        countc++;
                        ArrayList pListc = (ArrayList) itrc.next();
                        String tempc = (String) pListc.get(4);
                        String termc = tempc.substring(tempc.length() - 4);
                        
            %>
            
    <tr>
      <th scope="row"><%=pListc.get(1)%></th>
      <td><%=pListc.get(3)%></td>
      <td>Termina con: <%=termc%></td>
      <td> <%=pListc.get(5)%> <%=pListc.get(6)%> <%=pListc.get(7)%> (<%=pListc.get(8)%>)</td>
      <td><%=pListc.get(9) %></td>
      <td><%=pListc.get(2)%>&euro;</td>
      <!-- Dettagli ordine -->
      <td><button type="submit" class="btn btn-primary  btn-sm" id="<%=pListc.get(0) %>b1" form="<%=pListc.get(0) %>f1">Info</button></td>
      <form id="<%=pListc.get(0) %>f1" action="<%=request.getContextPath()%>/InfouserOrders" method="post">
      <input type="hidden" id="<%=pListc.get(0) %>pointer" name="pointer" value="1">
      <input type="hidden" id="<%=pListc.get(0) %>idch" name="idch" value="<%=pListc.get(0) %>">
      <input type="hidden" id="<%=pListc.get(0) %>cartdate" name="cartdate" value="<%=pListc.get(1) %>">
      </form>
      <!-- Conferma ordine -->
       <td><button type="submit" class="btn btn-success  btn-sm" id="<%=pListc.get(0) %>b2" form="<%=pListc.get(0) %>f2">Spedisci</button></td>
      <form id="<%=pListc.get(0) %>f2" action="<%=request.getContextPath()%>/SpedOrder" method="post">
      <input type="hidden" id="<%=pListc.get(0) %>idch" name="idch" value="<%=pListc.get(0) %>">
      </form>
      <!-- Elimina ordine -->
       <td><button type="submit" class="btn btn-danger  btn-sm" id="<%=pListc.get(0) %>b3" form="<%=pListc.get(0) %>f3">Blocca</button></td>
      <form id="<%=pListc.get(0) %>f3" action="<%=request.getContextPath()%>/PauseOrder" method="post">
      <input type="hidden" id="<%=pListc.get(0) %>idch" name="idch" value="<%=pListc.get(0) %>">
      </form>
    </tr>
    
    <%
                    }
                }
                if (countc == 0 && flagc == true) {
            %>
         			<div class="container center_div" style="padding:15px;">
            		<div class="alert alert-warning">
 					 Nessun ordine da confermare.
					</div>
					</div>
          
            <%            }
            %>	
    </tbody>
    </table>
    </div>
    </div>
</div>




<div id="SOrd" class="tabcontent">
<div class="container center_div">
  <div class="alert alert-primary" role="alert">
  Da questa sezione puoi gestire la spedizione degli ordini degli utenti.
</div>
  
  <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Data</th>
      <th scope="col">Intestatario carta</th>
      <th scope="col">Numero carta</th>
      <th scope="col">Indirizzo</th>
      <th scope="col">Utente</th>
      <th scope="col">Totale</th>
	  <th scope="col">Dettagli</th>
	  <th scope="col">Conferma </th>
	  <th scope="col">Blocca</th>
    </tr>
  </thead>
  <tbody>
  <%
                int counts = 0;
                String colors = "#F9EBB3";
                boolean flags = false;
                if (request.getAttribute("piLists") != null) {
                    ArrayList als = (ArrayList) request.getAttribute("piLists");
                    System.out.println(als);
                    Iterator itrs = als.iterator();
                    flags = true;
                    while (itrs.hasNext()) {
 
                        if ((counts % 2) == 0) {
                            colors = "#eeffee";
                        }
                        counts++;
                        ArrayList pLists = (ArrayList) itrs.next();
                        String temps = (String) pLists.get(4);
                        String terms = temps.substring(temps.length() - 4);
                        
            %>
            
    <tr>
      <th scope="row"><%=pLists.get(1)%></th>
      <td><%=pLists.get(3)%></td>
      <td>Termina con: <%=terms%></td>
      <td><%=pLists.get(5)%> <%=pLists.get(6)%> <%=pLists.get(7)%> (<%=pLists.get(8)%>)</td>
      <td><%=pLists.get(9) %></td>
      <td><%=pLists.get(2)%>&euro;</td>
      <!-- Dettagli ordine -->
      <td><button type="submit" class="btn btn-primary  btn-sm" id="<%=pLists.get(0) %>b4" form="<%=pLists.get(0) %>f4">Info</button></td>
      <form id="<%=pLists.get(0) %>f4" action="<%=request.getContextPath()%>/InfouserOrders" method="post">
      <input type="hidden" id="<%=pLists.get(0) %>pointer" name="pointer" value="2">
      <input type="hidden" id="<%=pLists.get(0) %>idch" name="idch" value="<%=pLists.get(0) %>">
      <input type="hidden" id="<%=pLists.get(0) %>cartdate" name="cartdate" value="<%=pLists.get(1) %>">
      </form>
      <!-- Conferma ordine -->
       <td><button type="submit" class="btn btn-success  btn-sm" id="<%=pLists.get(0) %>b5" form="<%=pLists.get(0) %>f5">Conferma </button></td>
      <form id="<%=pLists.get(0) %>f5" action="<%=request.getContextPath()%>/ConfirmOrder" method="post">
      <input type="hidden" id="<%=pLists.get(0) %>idch" name="idch" value="<%=pLists.get(0) %>">
      </form>
      <!-- Elimina ordine -->
       <td><button type="submit" class="btn btn-danger  btn-sm" id="<%=pLists.get(0) %>b6" form="<%=pLists.get(0) %>f6">Blocca </button></td>
      <form id="<%=pLists.get(0) %>f6" action="<%=request.getContextPath()%>/PauseOrder" method="post">
      <input type="hidden" id="<%=pLists.get(0) %>idch" name="idch" value="<%=pLists.get(0) %>">
      </form>
    </tr>
    
    <%
                    }
                }
                if (counts == 0 && flags == true) {
            %>
         			<div class="container center_div" style="padding:15px;">
            		<div class="alert alert-warning">
 					 Nessun ordine da confermare.
					</div>
					</div>
          
            <%            }
            %>	
    </tbody>
    </table>
    </div>
    </div>
<div id="ComOrd" class="tabcontent">
 <div class="container center_div">
  <div class="alert alert-primary" role="alert">
  Da questa sezione puoi visionare tutti gli ordini degli utenti andati a buon fine.
</div>
  <div style="overflow-x:auto;">
  <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Data</th>
      <th scope="col">Intestatario carta</th>
      <th scope="col">Numero carta</th>
      <th scope="col">Indirizzo</th>
      <th scope="col">Utente</th>
      <th scope="col">Totale</th>
	  <th scope="col">Dettagli</th>
    </tr>
  </thead>
  <tbody>
  <%
                int countf = 0;
                String colorf = "#F9EBB3";
                boolean flagf = false;
                if (request.getAttribute("piListf") != null) {
                    ArrayList alf = (ArrayList) request.getAttribute("piListf");
                    System.out.println(alf);
                    Iterator itrf = alf.iterator();
                    flagf = true;
                    while (itrf.hasNext()) {
 
                        if ((countf % 2) == 0) {
                            colorf = "#eeffee";
                        }
                        countf++;
                        ArrayList pListf = (ArrayList) itrf.next();
                        String tempf = (String) pListf.get(4);
                        String termf = tempf.substring(tempf.length() - 4);
                        
            %>
            
    <tr>
      <th scope="row"><%=pListf.get(1)%></th>
      <td><%=pListf.get(3)%></td>
      <td>Termina con: <%=termf%></td>
      <td><%=pListf.get(5)%> <%=pListf.get(6)%> <%=pListf.get(7)%> (<%=pListf.get(8)%>)</td>
      <td><%=pListf.get(9) %></td>
      <td><%=pListf.get(2)%>&euro;</td>
      <!-- Dettagli ordine -->
      <td><button type="submit" class="btn btn-primary  btn-sm" id="<%=pListf.get(0) %>b7" form="<%=pListf.get(0) %>f7">Info</button></td>
      <form id="<%=pListf.get(0) %>f7" action="<%=request.getContextPath()%>/InfouserOrders" method="post">
      <input type="hidden" id="<%=pListf.get(0) %>pointer" name="pointer" value="3">
      <input type="hidden" id="<%=pListf.get(0) %>idch" name="idch" value="<%=pListf.get(0) %>">
      <input type="hidden" id="<%=pListf.get(0) %>cartdate" name="cartdate" value="<%=pListf.get(1) %>">
      </form>
    </tr>
    
    <%
                    }
                }
                if (countf == 0 && flagf == true) {
            %>
         			<div class="container center_div" style="padding:15px;">
            		<div class="alert alert-warning">
 					 Nessun ordine da confermare.
					</div>
					</div>
          
            <%            }
            %>	
    </tbody>
    </table>
    </div>
</div>
</div>

<div id="BlockOrd" class="tabcontent">
  <div class="container center_div">
  <div class="alert alert-primary" role="alert">
  Da questa sezione puoi visionare gli ordini bloccati degli utenti.
</div>
<div style="overflow-x:auto;">
  <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Data</th>
      <th scope="col">Intestatario carta</th>
      <th scope="col">Numero carta</th>
      <th scope="col">Indirizzo</th>
      <th scope="col">Utente</th>
      <th scope="col">Totale</th>
	  <th scope="col">Dettagli</th>
	  <th scope="col">Sblocca</th>
	  <th scope="col">Cancella</th>
    </tr>
  </thead>
  <tbody>
  <%
                int countb = 0;
                String colorb = "#F9EBB3";
                boolean flagb = false;
                if (request.getAttribute("piListq") != null) {
                    ArrayList alb = (ArrayList) request.getAttribute("piListq");
                    System.out.println(alb);
                    Iterator itrb = alb.iterator();
                    flagc = true;
                    while (itrb.hasNext()) {
 
                        if ((countb % 2) == 0) {
                            colorb = "#eeffee";
                        }
                        countb++;
                        ArrayList pListb = (ArrayList) itrb.next();
                        String tempb = (String) pListb.get(4);
                        String termb = tempb.substring(tempb.length() - 4);
                        
            %>
            
    <tr>
      <th scope="row"><%=pListb.get(1)%></th>
      <td><%=pListb.get(3)%></td>
      <td>Termina con: <%=termb%></td>
      <td><%=pListb.get(5)%> <%=pListb.get(6)%> <%=pListb.get(7)%> (<%=pListb.get(8)%>)</td>
      <td><%=pListb.get(9) %></td>
      <td><%=pListb.get(2)%>&euro;</td>
      <!-- Dettagli ordine -->
      <td><button type="submit" class="btn btn-primary  btn-sm" id="<%=pListb.get(0) %>b9" form="<%=pListb.get(0) %>f9">Info</button></td>
      <form id="<%=pListb.get(0) %>f9" action="<%=request.getContextPath()%>/InfouserOrders" method="post">
      <input type="hidden" id="<%=pListb.get(0) %>pointer" name="pointer" value="4">
      <input type="hidden" id="<%=pListb.get(0) %>idch" name="idch" value="<%=pListb.get(0) %>">
      <input type="hidden" id="<%=pListb.get(0) %>cartdate" name="cartdate" value="<%=pListb.get(1) %>">
      </form>
      <!-- Conferma ordine -->
       <td><button type="submit" class="btn btn-success  btn-sm" id="<%=pListb.get(0) %>b10" form="<%=pListb.get(0) %>f10">Sblocca</button></td>
      <form id="<%=pListb.get(0) %>f10" action="<%=request.getContextPath()%>/SblockOrder" method="post">
      <input type="hidden" id="<%=pListb.get(0) %>idch" name="idch" value="<%=pListb.get(0) %>">
      </form>
      <!-- Elimina ordine -->
       <td><button type="submit" class="btn btn-danger  btn-sm" id="<%=pListb.get(0) %>b11" form="<%=pListb.get(0) %>f11">Cancella</button></td>
      <form id="<%=pListb.get(0) %>f11" action="<%=request.getContextPath()%>/DelOrder" method="post">
      <input type="hidden" id="<%=pListb.get(0) %>idch" name="idch" value="<%=pListb.get(0) %>">
      </form>
    </tr>
    
    <%
                    }
                }
                if (countb == 0 && flagb == true) {
            %>
         			<div class="container center_div" style="padding:15px;">
            		<div class="alert alert-warning">
 					 Nessun ordine da confermare.
					</div>
					</div>
          
            <%            }
            %>	
    </tbody>
    </table>
    </div>
    </div>
    </div>

<div id="DelOrd" class="tabcontent">
  <div class="container center_div" >
  <div class="alert alert-primary" role="alert">
  Da questa sezione puoi visionare gli ordini non andati a buon fine degli utenti.
</div>
  <div style="overflow-x:auto;">
  <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Data</th>
      <th scope="col">Intestatario carta</th>
      <th scope="col">Numero carta</th>
      <th scope="col">Indirizzo</th>
      <th scope="col">Utente</th>
      <th scope="col">Totale</th>
	  <th scope="col">Dettagli</th>
    </tr>
  </thead>
  <tbody>
  <%
                int countn = 0;
                String colorn = "#F9EBB3";
                boolean flagn = false;
                if (request.getAttribute("piListn") != null) {
                    ArrayList aln = (ArrayList) request.getAttribute("piListn");
                    System.out.println(aln);
                    Iterator itrn = aln.iterator();
                    flagc = true;
                    while (itrn.hasNext()) {
 
                        if ((countn % 2) == 0) {
                            colorn = "#eeffee";
                        }
                        countn++;
                        ArrayList pListn = (ArrayList) itrn.next();
                        String tempn = (String) pListn.get(4);
                        String termn = tempn.substring(tempn.length() - 4);
                        
            %>
            
    <tr>
      <th scope="row"><%=pListn.get(1)%></th>
      <td><%=pListn.get(3)%></td>
      <td>Termina con: <%=termn%></td>
      <td><%=pListn.get(5)%> <%=pListn.get(6)%> <%=pListn.get(7)%> (<%=pListn.get(8)%>)</td>
      <td><%=pListn.get(9) %></td>
      <td><%=pListn.get(2)%>&euro;</td>
      <!-- Dettagli ordine -->
      <td><button type="submit" class="btn btn-primary  btn-sm" id="<%=pListn.get(0) %>b12" form="<%=pListn.get(0) %>f12">Info</button></td>
            <form id="<%=pListn.get(0) %>f12" action="<%=request.getContextPath()%>/InfouserOrders" method="post">
      <input type="hidden" id="<%=pListn.get(0) %>pointer" name="pointer" value="5">
      <input type="hidden" id="<%=pListn.get(0) %>idch" name="idch" value="<%=pListn.get(0) %>">
      <input type="hidden" id="<%=pListn.get(0) %>cartdate" name="cartdate" value="<%=pListn.get(1) %>">
      </form>
    </tr>
    
    <%
                    }
                }
                if (countn == 0 && flagn == true) {
            %>
         			<div class="container center_div" style="padding:15px;">
            		<div class="alert alert-warning">
 					 Nessun ordine .
					</div>
					</div>
          
            <%            }
            %>	
    </tbody>
    </table>
    </div>
    </div>
</div>

<div id="AddAdmin" class="tabcontent">
  <div class="container center_div" >
  <div class="alert alert-primary" role="alert">
  Da questa sezione puoi aggiungere amministratori. Registrali e inviagli le credenziali per l'accesso.
</div>
<form id=regvalidation name="form"action="<%=request.getContextPath()%>/RegisterAdmin" method="post" onsubmit="return stopsubmit2(this);">
	  <div class="form-row">
    <div class="form-group col-md-4">
      <label>Email</label><label id="commentEmailPrompt"></label>
      <input name="email" id="commentEmail" onkeyup="validateEmail()" type="email" class="form-control" id="" placeholder="Email" required="required" autocomplete="off">
    </div>
    <div class="form-group col-md-4">
      <label>Password</label><label id="commentPassPrompt"></label>
      <input name="password" id="commentPass" onkeyup="validatePass()" type="password" class="form-control" id="" placeholder="Password" required="required" autocomplete="off">
    </div>
        <div class="form-group col-md-4">
      <label>Ripeti Password</label><label id="commentPass2Prompt"></label>
      <input name="rpassword" id="commentPass2" onkeyup="validatePass2()" type="password" class="form-control"  placeholder="Ripeti Password" required="required" autocomplete="off" >
    </div>
  </div>
  <button type="submit" class="btn btn-primary">Aggiungi Admin</button>
  <label id="errorMessage"></label>
</form>
<br><br>
<div class="alert alert-primary" role="alert">
  Se non riesci a generare una password sicura, puoi utilizzare il tuo tool in Javascript!
</div>

<a class="btn btn-primary" href="#" data-toggle="modal" data-target="#myModal2">Generatore di password casuali JavaScript</a><br/>

 <div class="modal" id="myModal2">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 align="center" class="modal-title">HWBAR-tool generazione password sicure</h4>
        </div>
        
        <!-- Modal body -->
<div class="modal-body" align="center">	
<div class="alert alert-info" role="alert">
  Utilizza il tuo tool per generare delle password sicure! (javascript)
</div>
<span  class="badge badge-pill badge-warning">Lunghezza minima 10 caratteri</span>
<span class="badge badge-pill badge-warning">Necessaria una lettera maiscuola e una minuscola</span>
<span class="badge badge-pill badge-warning">Necessario almeno un simbolo</span><br/>
Lunghezza password(minimo 10)<input type="number" id="charNum" value="12" min="10" max="60" /><br />
Numeri <input type="checkbox" id="num" checked>
Simboli <input type="checkbox" id="sym" checked><br />
<button id="submit" type="button" class="btn btn-primary" >Genera Passwd</button><br />
Ecco la tua password sicura per il nuovo admin: <input class="form-control" type="text" id="yourPw" size="35" readonly><button class="btn btn-primary" onclick="copia()">Copia pwd</button>
</div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
        </div>
     </div>
    </div>
</div>
</div>
</div>
<div id="Ass" class="tabcontent">
    <div class="container center_div">
  <div class="alert alert-primary" role="alert">
  Da questa sezione puoi visionare i ticket (richieste) degli utenti.
</div>
<div style="overflow-x:auto;">
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Email utente:</th>
      <th scope="col">Stato ticket:</th>
      <th scope="col">Descrizione problema:</th>
    </tr>
  </thead>
  <tbody>
  <%
                int countna = 0;
                boolean flagna = false;
                if (request.getAttribute("piListna") != null) {
                    ArrayList alna = (ArrayList) request.getAttribute("piListna");
                    System.out.println(alna);
                    Iterator itrna = alna.iterator();
                    flagna = true;
                    while (itrna.hasNext()) {
                        countna++;
                        ArrayList pListna = (ArrayList) itrna.next();
                        
            %>
            <div class="modal" id="ticketmodal<%=pListna.get(0)%>">
    		<div class="modal-dialog">
      		<div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Ticket id <%=pListna.get(0)%> email user: <%=pListna.get(1)%></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" align="center">
        	<%=pListna.get(3)%>	
        </div>
    	        <!-- Modal footer -->
 		<div class="modal-footer">
        <form id="ticketr<%=pListna.get(0)%>" action="<%=request.getContextPath()%>/Ticketanswer" method="post">
        <input type="hidden" id="<%=pListna.get(0) %>pointer" name="pointer" value="6">
        <input type="hidden" id="<%=pListna.get(0) %>mail" name="mail" value="<%=pListna.get(1)%>">
        <input type="hidden" id="<%=pListna.get(0) %>pro" name="problema" value="<%=pListna.get(3)%>">
        <input type="hidden" id="<%=pListna.get(0) %>idtick" name="idtick" value="<%=pListna.get(0)%>">
        </form>
        <button id="ticketb<%=pListna.get(0)%>" type="submit" class="btn btn-info" form="ticketr<%=pListna.get(0)%>">Rispondi al ticket</button>
        </div>
        
      </div>
    </div>
  </div>
            
    <tr>
      <th scope="row"><%=pListna.get(1)%></th>
      <td><%if((int)pListna.get(2) == 0){ %> <p class="text-warning"><strong>Ticket non risposto</strong></p>
      <%}else if((int)pListna.get(2) == 1){ %>
      <p class="text-success"><strong>Ticket risposto</strong></p><%} %></td>
      <td><button class="btn btn-info btn-sm" type="button" data-toggle="modal" data-target="#ticketmodal<%=pListna.get(0)%>">Vedi ticket</button></td>
    </tr>
    <%
                    }
                }
                
                if (countna == 0 && flagna == true) {
            %>    
         			<div class="container center_div" style="padding:15px;">
            		<div class="alert alert-warning">
 					 Nessun Ticket.
					</div>
					</div>
          
            <%            }
            %>	
    </tbody>
    </table>
    </div>
    </div>
    </div>
${Message}
${errorMessage}
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
document.getElementById("Panel1").click();
</script>
<script>
${reload}
</script> 
<script>
function copia() {
  var copyText = document.getElementById("yourPw");
  copyText.select();
  copyText.setSelectionRange(0, 99999)
  document.execCommand("copy");
  alert("Testo copiato: " + copyText.value);
}
</script>
<script type="text/javascript">
$('#ServletMessage').delay(2500).fadeOut(450);
</script>
<script type="text/javascript" src="js/validationForm/validationprof.js"></script>
<script type="text/javascript" src="js/validationForm/passwd.js"></script>
</body>
</html>