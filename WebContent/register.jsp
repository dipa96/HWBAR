<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>HWBAR</title>
<!-- Css -->
<link rel="stylesheet" type="text/css"  href="/../HWBAR1/css/stile.css">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:200,100,400" rel="stylesheet" type="text/css" />
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
<div class="container center_div" style=" padding:15px;">
  <div class="alert alert-primary" role="alert">
  Registrati qui!
</div>
<form id=regvalidation name="form"action="<%=request.getContextPath()%>/RegisterServlet" method="post" onsubmit="return stopsubmit(this);">
  <div class="form-row">
    <div class="form-group col-md-4">
      <label>Nome</label><label id="commentNamePrompt"></label>
      <input name="nome" id="commentName" onkeyup="validateName()" type="text" class="form-control" id="" placeholder="Nome"  required="required" autocomplete="off">
    </div>
    <div class="form-group col-md-4">
      <label>Cognome</label><label id="commentCognomePrompt"></label>
      <input name="cognome" id ="commentCognome" onkeyup="validateCognome()" type="text" class="form-control" id="" placeholder="Cognome" required="required" autocomplete="off">
    </div>
        <div class="form-group col-md-4">
      <label>Data di nascita</label><label id="commentDNascPrompt"></label>
      <%-- <input name=dnascita class="form-control" id="dnascita" required="required" size=10 maxlength=10  onkeyup="this.value=this.value.replace(/^(\d\d)(\d)$/g,'$1/$2').replace(/^(\d\d\/\d\d)(\d+)$/g,'$1/$2').replace(/[^\d\/]/g,'')">--%>
      <input name="dnascita" type="text" class="form-control" id="CommentDnascita" placeholder="Data di nascita" onkeyup="validateDnascita(), this.value=this.value.replace(/^(\d\d)(\d)$/g,'$1/$2').replace(/^(\d\d\/\d\d)(\d+)$/g,'$1/$2').replace(/[^\d\/]/g,'')" required="required" >
    </div>
  </div>
  <div class="form-row">
    <div class="form-group col-md-4">
      <label>Città</label><label id="commentCittaPrompt"></label>
      <input name="city" id="commentCitta" onkeyup="validateCitta()" type="text" class="form-control" id="" placeholder="Città" required="required" autocomplete="off" >
    </div>
      <%-- 
      <div class="form-group col-md-4">
      <label>Stato</label><label id="commentStatoPrompt"></label>
      <select name="stato" id="commentStato" onkeyup="validateStato()" class="form-control" required="required">
        <option selected>...</option>
        <option>Italia</option>
        <option>Germania</option>
        <option>Francia</option>
        <option>Mozambico</option>
        <option>Lacedonia</option>
      </select>
    </div> --%>
  <div  class="form-group col-md-4">
      <label>Indirizzo di residenza</label><label id="commentIndirizzoPrompt"></label>
      <input name="indirizzo" id="commentIndirizzo" onkeyup="validateIndirizzo()" type="text" type="text" class="form-control" id="" placeholder="Indirizzo" required="required" autocomplete="off">
  </div> 
        <div class="form-group col-md-4">
      <label>CAP</label><label id="commentCapPrompt"></label>
      <input name="cap" id="commentCap" onkeyup="validateCap()" type="text" class="form-control" id="" placeholder="CAP" required="required" autocomplete="off"  >
    </div>
  </div>
  <div class="form-row">

     <%--<div class="form-group col-md-6">
      <label>Numero Civico</label><label id="commentCivicoPrompt"></label>
      <input name="civico" id="commentCivico" onkeyup="validateCivico()" type="text" class="form-control" id="" placeholder="Civico(n)">
    </div>  --%> 
  </div>
   <div class="form-row">
    <div  class="form-group col-md-12">
      <label>Cellulare</label><label id="commentPhonePrompt"></label>
      <input name="ntel1" id="commentPhone" onkeyup="validatePhone()" type="text" class="form-control" id="" placeholder="Cellulare" required="required" autocomplete="off" >
    </div>
   <%-- <div class="form-group col-md-6">
      <label>Numero Casa</label><label id="commentPhonePrompt2"></label>
      <input name="ntel2" id="commentPhone2" onkeyup="validatePhone2()" type="text" class="form-control" id="" placeholder="Numero casa">
    </div>  --%>
  </div>
	  <div class="form-row">
    <div class="form-group col-md-4">
      <label>Email</label><label id="commentEmailPrompt"></label>
      <input name="email" id="commentEmail" onkeyup="validateEmail()" type="email" class="form-control" id="" placeholder="Email" required="required" utocomplete="off" >
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
  <button type="submit" class="btn btn-primary">Registrati</button><label style="color:red;text-align:center">${Message}</label>
  <label id="errorMessage"></label>
</form>
<br><br>
<div class="alert alert-primary" role="alert">
  Se non riesci a generare una password sicura, puoi utilizzare il nostro tool in Javascript!
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
  Utilizza il nostro tool per generare delle password sicure! (javascript)
</div>
<span  class="badge badge-pill badge-warning">Lunghezza minima 10 caratteri</span>
<span class="badge badge-pill badge-warning">Necessaria una lettera maiscuola e una minuscola</span>
<span class="badge badge-pill badge-warning">Necessario almeno un simbolo</span><br/>
Lunghezza password(minimo 10)<input type="number" id="charNum" value="12" min="10" max="60" /><br />
Numeri <input type="checkbox" id="num" checked>
Simboli <input type="checkbox" id="sym" checked><br />
<button id="submit" type="button" class="btn btn-primary" >Genera Passwd</button><br />
Ecco la tua password sicura per HWBAR: <input class="form-control" type="text" id="yourPw" size="35" readonly><button class="btn btn-primary" onclick="copia()">Copia pwd</button>
</div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
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
<script type="text/javascript" src="js/validationForm/validationreg.js"></script>
<script type="text/javascript" src="js/validationForm/passwd.js"></script>
<script>
function copia() {
  var copyText = document.getElementById("yourPw");
  copyText.select();
  copyText.setSelectionRange(0, 99999)
  document.execCommand("copy");
  alert("Testo copiato: " + copyText.value);
}
</script>
<script>
window.onload = function() {
    var duration = 3000; //3 seconds
    setTimeout(function () { $('#ServletMessage').fadeOut('slow'); }, duration);
};
</script>
</body>
</html>