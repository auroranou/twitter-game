var Question = function(){
}

Question.prototype = {
	load: function(callback){
		$.ajax({
			type: 'GET', 
			dataType: 'json', 
			url: window.location.origin + '/questions.json',
			success: callback
		});
	}
}