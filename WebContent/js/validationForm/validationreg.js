function validateName()
{
	var name = document.getElementById("commentName").value;
	
	if(name.length == 0)
	{
		producePrompt("--><span class='badge badge-pill badge-danger'>Il campo non pu&ograve rimanere vuoto!</span>", "commentNamePrompt" , "red");
		return false;
	}
	
	if(name.length <= 2)
	{
		producePrompt("--><span class='badge badge-pill badge-danger'>Nome troppo corto!</span>", "commentNamePrompt" , "red");
		return false;
	}
	if(!name.match(/^(?=.{1,50}$)[a-z]+(?:['_.\s][a-z]+)*$/i))
		{
		producePrompt("--><span class='badge badge-pill badge-danger'>Input accetta solo lettere</span>", "commentNamePrompt", "red" );
		return false;
		}
	
	producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentNamePrompt" , "green");
	return true;
}

	

function validatePhone()
{
var phone = document.getElementById("commentPhone").value;	

if(phone.length == 0)
	{
		producePrompt("--><span class='badge badge-pill badge-danger'>Il campo non pu&ograve rimanere vuoto!</span>", "commentPhonePrompt" , "red");
		return false;
	}

if(!phone.match(/^[0-9]{10}$/))
	{
	producePrompt("--><span class='badge badge-pill badge-danger'>Includere solo cifre!(10)</span>", "commentPhonePrompt", "red" );
	return false;
	}
	producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentPhonePrompt" , "green");
	return true;
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

if(email.length == 0) 
	{
	producePrompt("<span class='badge badge-pill badge-danger'>Il campo non pu&ograve rimanere vuoto!</span>", "commentEmailPrompt", "red");
	return false;
	}

if(!email.match(/^[A-Za-z\._\-0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/))
	{
	producePrompt("--><span class='badge badge-pill badge-danger'>Formato Email non valido!</span>","commentEmailPrompt", "red");
	return false;
	}

producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentEmailPrompt", "green");

}

function validateCognome()
{
	var cognome = document.getElementById("commentCognome").value;
	
	if(cognome.length == 0)
	{
		producePrompt("--><span class='badge badge-pill badge-danger'>Il campo non pu&ograve rimanere vuoto!</span>", "commentCognomePrompt" , "red");
		return false;
	}
	
	if(cognome.length <= 2)
	{
		producePrompt("--><span class='badge badge-pill badge-danger'>Troppo corto!</span>", "commentCognomePrompt" , "red");
		return false;
	}
	if(!cognome.match(/^(?=.{1,50}$)[a-z]+(?:['_.\s][a-z]+)*$/i))
		{
		producePrompt("<span class='badge badge-pill badge-danger'>Qui puoi inserire solo lettere!</span>", "commentCognomePrompt", "red" );
		return false;
		}
	
	producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentCognomePrompt" , "green");
	return true;
}

function validateIndirizzo()
{
	var indirizzo = document.getElementById("commentIndirizzo").value;
	
	if(indirizzo.length == 0)
	{
		producePrompt("<span class='badge badge-pill badge-danger'>Il campo non pu&ograve rimanere vuoto!</span>", "commentIndirizzoPrompt" , "red");
		return false;
	}
	
	if(indirizzo.length <= 2)
	{
		producePrompt("<span class='badge badge-pill badge-danger'>Indirizzo troppo corto!</span>", "commentIndirizzoPrompt" , "red");
		return false;
	}
	if(!indirizzo.match(/^[#.0-9a-zA-Z\s,-]+$/))
		{
		producePrompt("<span class='badge badge-pill badge-danger'>Indirizzo non valido!</span>", "commentIndirizzoPrompt", "red" );
		return false;
		}
	
	producePrompt("<span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentIndirizzoPrompt" , "green");
	return true;
	
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
	
	if(citta.length == 0)
	{
		producePrompt("--><span class='badge badge-pill badge-danger'>Il campo non pu&ograve rimanere vuoto!</span>", "commentCittaPrompt" , "red");
		return false;
	}
	
	if(citta.length <= 2)
	{
		producePrompt("--><span class='badge badge-pill badge-danger'>Lunghezza minima 3!</span>", "commentCittaPrompt" , "red");
		return false;
	}
	if(!citta.match(/^(?=.{1,50}$)[a-z]+(?:['_.\s][a-z]+)*$/i))
		{
		producePrompt("--><span class='badge badge-pill badge-danger'>Accetta solo lettere!</span>", "commentCittaPrompt", "red" );
		return false;
		}
	
	producePrompt("<span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentCittaPrompt" , "green");
	return true;
}

function validateCap()
{
	var cap = document.getElementById("commentCap").value;	

	if(cap.length == 0)
		{
			producePrompt("<span class='badge badge-pill badge-danger'>Il campo non pu&ograve rimanere vuoto!</span>", "commentCapPrompt" , "red");
			return false;
		}
	
	if(!cap.match(/^[0-9]{5,6}$/))
		{
		
		producePrompt("<span class='badge badge-pill badge-danger'>Includere solo cifre(range 5-6 numeri)!</span>", "commentCapPrompt", "red" );
		return false;
		}
		producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentCapPrompt" , "green");
		return true;
}
function validatePass()
{
	var pass1 = document.getElementById("commentPass").value;
	if(pass1.length == 0)
		{
		producePrompt("<span class='badge badge-pill badge-danger'>Il campo non pu&ograve rimanere vuoto!</span>", "commentPassPrompt", "red");
		return false;
		}
	
	if(!pass1.match(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/))
		{
		producePrompt("<span class='badge badge-pill badge-danger'>Password non sicura, utilizza il nostro tool!</span>", "commentPassPrompt", "red");
		return false;
		}
		producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentPassPrompt","green");
		return true;
}

function validatePass2()
{
	var pass1 = document.getElementById("commentPass").value;
	var pass2 = document.getElementById("commentPass2").value;
	
	if(pass2.length == 0)
		{
		producePrompt("<span class='badge badge-pill badge-danger'>Il campo non pu&ograve rimanere vuoto!</span>", "commentPass2Prompt", "red");
		return false;
		}
	if(pass1 !== pass2)
		{
		producePrompt("<span class='badge badge-pill badge-danger'>Le password non coincidono!</span>", "commentPass2Prompt", "red");
		return false;
		}
		producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentPass2Prompt","green");
		return true;
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
	if (dnascita.length == 0) 
		{
		producePrompt("<span class='badge badge-pill badge-danger'>Il campo non pu&ograve rimanere vuoto!</span>", "commentDNascPrompt", "red");
		return false;
		}
	if(!dnascita.match(/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19[5-9][0-9]|20[0-0][0-2])$/))
		{
		producePrompt("<span class='badge badge-pill badge-danger'>Data di nascita non valida!</span>", "commentDNascPrompt", "red");
		return false;
		}
	producePrompt("--><span class='badge badge-pill badge-success'><svg class='bi bi-check-circle' width='1em' height='1em' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/><path fill-rule='evenodd' d='M10.97 4.97a.75.75 0 0 1 1.071 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.236.236 0 0 1 .02-.022z'/></svg></span>", "commentDNascPrompt","green");
	return true;
}

function stopsubmit()
{
	
	var name = document.getElementById("commentName").value;
	var cognome = document.getElementById("commentCognome").value;
	var dnascita = document.getElementById("CommentDnascita").value;
	var cap = document.getElementById("commentCap").value;	
	var citta = document.getElementById("commentCitta").value;
	var indirizzo = document.getElementById("commentIndirizzo").value;
	var phone = document.getElementById("commentPhone").value;	
	var email = document.getElementById("commentEmail").value;
	var pass1 = document.getElementById("commentPass").value;
	var pass2 = document.getElementById("commentPass2").value;

	
	if(name.length <= 2)
	{
		producePrompt("--><span class='badge badge-pill badge-danger'>Nome troppo corto!</span>", "errorMessage" , "red");
		event.preventDefault();
		return false;
	}
	
	if(!name.match(/^(?=.{1,50}$)[a-z]+(?:['_.\s][a-z]+)*$/i))
	{
	producePrompt("<span class='badge badge-pill badge-danger'>ATTENZIONE - caratteri invalidi NOME!</span>", "errorMessage", "red" );
	event.preventDefault();
	return false;
	}
	if(cognome.length <= 2)
	{
		producePrompt("--><span class='badge badge-pill badge-danger'>ATTENZIONE - Cognome troppo corto!</span>", "errorMessage" , "red");
		event.preventDefault();
		return false;
	}
	if(!cognome.match(/^(?=.{1,50}$)[a-z]+(?:['_.\s][a-z]+)*$/i))
		{
		producePrompt("--><span class='badge badge-pill badge-danger'>ATTENZIONE - caratteri invalidi COGNOME!</span>", "errorMessage", "red" );
		event.preventDefault();
		return false;
		}
	
	if(!dnascita.match(/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19[5-9][0-9]|20[0-0][0-2])$/))
	{
	producePrompt("<span class='badge badge-pill badge-danger'>Data di nascita non valida!</span>", "errorMessage", "red");
	event.preventDefault();
	return false;
	}
	if(citta.length <= 2)
	{
		producePrompt("--><span class='badge badge-pill badge-danger'>ATTENZIONE - citt&agrave troppo corta!</span>", "errorMessage" , "red");
		event.preventDefault();
		return false;
	}
	if(!citta.match(/^(?=.{1,50}$)[a-z]+(?:['_.\s][a-z]+)*$/i))
		{
		producePrompt("--><span class='badge badge-pill badge-danger'>ATTENZIONE - caratteri invalidi citt&agrave!</span>", "errorMessage", "red" );
		event.preventDefault();
		return false;
		}
	if(indirizzo.length <= 2)
	{
		producePrompt("<span class='badge badge-pill badge-danger'>ATTENZIONE - indirizzo troppo corto!</span>", "errorMessage" , "red");
		event.preventDefault();
		return false;
	}
	if(!indirizzo.match(/^[#.0-9a-zA-Z\s,-]+$/))
		{
		producePrompt("<span class='badge badge-pill badge-danger'>ATTENZIONE - caratteri invalidi Indirizzo!</span>", "errorMessage", "red" );
		event.preventDefault();
		return false;
		}
	
	if(!cap.match(/^[0-9]{5,6}$/))
		{
		producePrompt("<span class='badge badge-pill badge-danger'>ATTENZIONE - caratteri invalidi CAP!</span>", "errorMessage", "red" );
		event.preventDefault();
		return false;
		}
	if(!phone.match(/^[0-9]{10}$/))
	{
	producePrompt("--><span class='badge badge-pill badge-danger'>ATTENZIONE - caratteri invalidi Cellulare!</span>", "errorMessage", "red" );
	event.preventDefault();
	return false;
	}
	if(!email.match(/^[A-Za-z\._\-0-9]*[@][A-Za-z]*[\.][a-z]{2,4}$/))
	{
	producePrompt("<span class='badge badge-pill badge-danger'>ATTENZIONE - caratteri invalidi Email!</span></span>","errorMessage", "red");
	event.preventDefault();
	return false;
	}
	if(!pass1.match(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/))
	{
	producePrompt("<span class='badge badge-pill badge-danger'>ATTENZIONE - caratteri invalidi Password!</span>", "errorMessage", "red");
	event.preventDefault();
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