<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HWBAR</title>
<!-- Css -->
<link rel="stylesheet" type="text/css"  href="/../HWBAR1/css/stile.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- script -->

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
<div style="text-align:center"><h1>Accedi</h1> </div>
    <br>
    <!--  
    <form name="form" action="<%=request.getContextPath()%>/LoginServlet" method="post">
        <!-- Do not use table to format fields. As a good practice use CSS 
        <table align="center">
         <tr>
         <td>Email:</td>
         <td><input type="text" name="email"/></td>
         </tr>
         <tr>
         <td>Password:</td>
         <td><input type="password" name="password" /></td>
         </tr>
         <tr>
         <td></td>
         <td><input type="submit" value="Login"></td>
         </tr>
        </table>
</form> -->

<div class="container center_div" style=" padding:15px;">
<form name="form" action="<%=request.getContextPath()%>/LoginServlet" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Indirizzo E-Mail</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Inserisci email">
    <small id="emailHelp" class="form-text text-muted">Non condivideremo la tua email con nessuno, forse...</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Login</button>
</form>
</div>
<div style="color:red;text-align:center">${errorMessage}</div>
<div style="text-align:center"><p>Se non possiedi un account <a href="register.jsp">Registrati</a> ora!</p></div>
<div class="mobile-margin visible-xs">
  <footer class="footer">
<nav class="navbar bg-dark navbar-dark">
  <span class="navbar-text">
    Sito a scopo dimostrativo per progetto TSW. Studenti: Federico Pio mat.0512103880 ,  Donato Di Pasquale mat.0512104614.
  </span>
</nav>    
</footer>
</div>
  <div class="modal" id="ServletMessagem">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Log-out</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body" align="center">
          ${Message}
        </div>
      </div>
    </div>
  </div>
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