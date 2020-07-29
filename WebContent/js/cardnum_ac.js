
$('input[name=numcard]').keypress(function(){
	 var rawNumbers = $(this).val().replace(/-/g,'');
	 var cardLength = rawNumbers.length;
	 if(cardLength !==0 && cardLength <=12 && cardLength % 4 == 0){
	   $(this).val($(this).val()+'-');
	 }
	});
