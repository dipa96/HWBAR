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
  </div>
</nav>
<form action="<%=request.getContextPath()%>/torna" id="torna" method="post">
<input type="hidden" name="pointer" value="<%=request.getAttribute("pointer") %>">
</form>
<div class="container center_div" style=" padding:15px;">
 <div class="card">
  <div class="card-header">
  <div class="pb-sm-5">
  <button type="submit" class="btn btn-info  btn-sm float-left" form="torna"><svg class="bi bi-arrow-left-square" width="1.3em" height="1.3em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  <path fill-rule="evenodd" d="M8.354 11.354a.5.5 0 0 0 0-.708L5.707 8l2.647-2.646a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708 0z"/>
  <path fill-rule="evenodd" d="M11.5 8a.5.5 0 0 0-.5-.5H6a.5.5 0 0 0 0 1h5a.5.5 0 0 0 .5-.5z"/>
  </svg> Torna al profilo</button></div>
  <h2 class="text-center">Cronologia acquisto del: <%=request.getAttribute("data") %></h2>
  </div>
<div class="main" style="float:center">
<table class="table" id="ricevuta">
  <thead class="thead-dark">
    <tr>
      <th>Nome prodotto:</th>
      <th>Descrizione:</th>
      <th>Prezzo al pezzo:</th>
      <th>Quantit&agrave;:</th>
      <th>Totale:</th>
    </tr>
  </thead>
  <tbody>
       <%
                int countc = 0;
                String colorc = "#F9EBB3";
                double totale = 0.00;
                if (request.getAttribute("cartList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("cartList");
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
      <th scope="row"><%=pList.get(0)%></th>
      <th><%=pList.get(5)%> </th>
      <td><%=pList.get(1)%> &euro;</td>
      <td>x<%=pList.get(2)%> </td>
      <%double temptot =(double)pList.get(1) * (int)pList.get(2);
      temptot = temptot * 100; int temptot2 = (int) temptot; double totp = (double) temptot2 / 100;
      %>
      <td><%= totp%> &euro;</td>
    </tr>


                <%
                    }   
                }%>             
	<tr>
	<td></td>
	<td></td>
	<td></td>
	<td><strong>Totale carrello:</strong></td>
	<td><strong><%=totale %> &euro;</strong></td>
	</tr>
	<tr style="display:none">
	<td></td>
	<td></td>
	<td></td>
	<td><strong>Cronologia acquisto del:</strong></td>
	<td><strong><%=request.getAttribute("data") %></strong></td>
	</tr>
	</tbody>  
    </table>
</div>

            <%if (countc == 0) {
            %>
         	<div class="card-footer text-muted">
            <h3 class="text-center">Il carrello &egrave; vuoto...</h3>
          	</div>
            <%            }else{
            %>
			<div class="card-footer text-right">
            <button id="pdf" onclick="generate()" class="btn btn-success"><svg class="bi bi-download" width="1.3em" height="1.3em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  			<path fill-rule="evenodd" d="M.5 8a.5.5 0 0 1 .5.5V12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V8.5a.5.5 0 0 1 1 0V12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V8.5A.5.5 0 0 1 .5 8z"/>
  			<path fill-rule="evenodd" d="M5 7.5a.5.5 0 0 1 .707 0L8 9.793 10.293 7.5a.5.5 0 1 1 .707.707l-2.646 2.647a.5.5 0 0 1-.708 0L5 8.207A.5.5 0 0 1 5 7.5z"/>
  			<path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v8a.5.5 0 0 1-1 0v-8A.5.5 0 0 1 8 1z"/>
			</svg> Scarica fattura (PDF)</button>
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
function generate() {
	$("#pdf").attr("disabled", true);
  var doc = new jsPDF('p','pt','a4');
  doc.autoTable({ html: '#ricevuta' })
  doc.save("ricevuta.pdf");
}

</script>
<script>
window.onload = function() {
    var duration = 3000; //2 seconds
    setTimeout(function () { $('#ServletMessage').fadeOut('slow'); }, duration);
};
</script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.0.10/jspdf.plugin.autotable.min.js"></script>
</body>
</html>