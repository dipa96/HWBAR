function validateName()
{
	var name = document.getElementById("commentName").value;
	
	
	if(name.match(/^(?=.{1,50}$)[a-z]+(?:['_.\s][a-z]+)*$/i) || name.length == 0) {
		producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentNamePrompt" , "green");
		return true;
	}
	producePrompt("--><span class='badge badge-pill badge-danger'>Sbagliato!</span>", "commentNamePrompt" , "red");
	return false;	
}

function validatePhone()
{
var phone = document.getElementById("commentPhone").value;	

if(phone.match(/^[0-9]{10}$/) || phone.length == 0)
	{
	producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentPhonePrompt" , "green");
	return true;
	}
	producePrompt("--><span class='badge badge-pill badge-danger'>Includere solo cifre!(10)</span>", "commentPhonePrompt", "red" );
	return false;
}
/*
function validatePhone2()
{
	var phone2 = document.getElementById("commentPhone2").value;	

	if(!phone2.match(/^[0-9]{10}$/))
		{
		producePrompt("---Includere solo cifre(massimo 10)", "commentPhone2Prompt", "red" );
		return false;
		}
		producePrompt("---Numero valido", "commentPhone2Prompt" , "green");
		return true;
}
*/
function validateEmail()
{
var email = document.getElementById("commentEmail").value;

if(email.match(/^[A-Za-z\._\-0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/) || email.length == 0)
	{
	producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentEmailPrompt", "green");
	return true;
	}
producePrompt("--><span class='badge badge-pill badge-danger'>Formato Email non valido!</span>","commentEmailPrompt", "red");
return false;

}

function validateCognome()
{
	var cognome = document.getElementById("commentCognome").value;

	if(cognome.match(/^(?=.{1,50}$)[a-z]+(?:['_.\s][a-z]+)*$/i) || cognome.length == 0)
		{
		producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentCognomePrompt" , "green");
		return true;
		}
	producePrompt("<span class='badge badge-pill badge-danger'>Qui puoi inserire solo lettere!</span>", "commentCognomePrompt", "red" );
	return false;
}

function validateIndirizzo()
{
	var indirizzo = document.getElementById("commentIndirizzo").value;

	if(indirizzo.match(/^[#.0-9a-zA-Z\s,-]+$/) || indirizzo.length == 0)
		{
		producePrompt("<span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentIndirizzoPrompt" , "green");
		return true;
		}
		producePrompt("<span class='badge badge-pill badge-danger'>Indirizzo non valido!</span>", "commentIndirizzoPrompt", "red" );
		return false;
	
}


/*
function validateCivico()
{
	var civico = document.getElementById("commentCivico").value;	

	if(civico.length == 0)
		{
			producePrompt("--><span class='badge badge-pill badge-alert'>Il campo non pu&ograve rimanere vuoto!</span>", "commentCivicoPrompt" , "red");
			return false;
		}
	
	if(!civico.match(/^[0-9]*$/))
		{
		producePrompt("--><span class='badge badge-pill badge-alert'>Includere solo cifre(max 5)!</span>", "commentCivicoPrompt", "red" );
		return false;
		}
		producePrompt("---Civico valido", "commentCivicoPrompt" , "green");
		return true;
}
*/
function validateCitta()
{
	var citta = document.getElementById("commentCitta").value;


	if(citta.match(/^(?=.{1,50}$)[a-z]+(?:['_.\s][a-z]+)*$/i) || citta.length == 0)
		{
		producePrompt("<span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentCittaPrompt" , "green");
		return true;
		}
	
	producePrompt("<span class='badge badge-pill badge-danger'>Accetta solo lettere!</span>", "commentCittaPrompt", "red" );
	return false;
}

function validateCap()
{
	var cap = document.getElementById("commentCap").value;	

	if(cap.match(/^[0-9]{5,6}$/) || cap.length == 0)
		{
		producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentCapPrompt" , "green");

		return true;
		}
		producePrompt("<span class='badge badge-pill badge-danger'>Includere solo cifre(range 5-6 numeri)!</span>", "commentCapPrompt", "red" );
		return false;
}
/*
function validateStato()
{
var stato = document.getElementById("commentStato").value;
if(stato === "...")
	{
	producePrompt("<span class='badge badge-pill badge-warning'>Il campo non pu&ograve rimanere vuoto!</span>", "commentStatoPrompt", "red");
	return false;
	}
return true;;
} 
*/
function validateDnascita()
{
	var dnascita = document.getElementById("CommentDnascita").value;
	
	if(dnascita.match(/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19[5-9][0-9]|20[0-0][0-2])$/) || dnascita.length == 0)
		{
		producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentDNascPrompt","green");
		return true;
		}
	producePrompt("<span class='badge badge-pill badge-danger'>Data di nascita non valida!</span>", "commentDNascPrompt", "red");
	return false;
}



function validatePass()
{
	var pass1 = document.getElementById("commentPass").value;
	
	if(pass1.match(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/) || pass1.length == 0)
		{
		producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentPassPrompt","green");
		return true;
		}
		producePrompt("<span class='badge badge-pill badge-danger'>Password non sicura, utilizza il nostro tool!</span>", "commentPassPrompt", "red");
		return false;
}

function validatePass2()
{
	var pass1 = document.getElementById("commentPass").value;
	var pass2 = document.getElementById("commentPass2").value;
	
	if(pass2.length == 0 || pass1 == pass2)
		{
		producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentPass2Prompt","green");
		return true;
		}
	if(pass1 !== pass2)
		{
		producePrompt("<span class='badge badge-pill badge-danger'>Le password non coincidono!</span>", "commentPass2Prompt", "red");
		return false;
		}
}




function stopsubmit2()
{
	var pass1 = document.getElementById("commentPass").value;
	var pass2 = document.getElementById("commentPass2").value;
	
	if(!pass1.match(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/) && !pass2.match(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/)) {
		
		producePrompt("<span class='badge badge-pill badge-danger'>Le password non coincidono!</span>", "commentPass2Prompt", "red");
		return false;
		
	}

	if(pass1 !== pass2)
	{
	producePrompt("<span class='badge badge-pill badge-danger'>ATTENZIONE - Le password non coincidono!</span>", "errorMessage", "red");
	event.preventDefault();
	return false;
	}
	
	
}

function producePrompt(message,promptLocation,color) 
{
	document.getElementById(promptLocation).innerHTML = message;
	document.getElementById(promptLocation).style.color = color;
}