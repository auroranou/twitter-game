var Score = function(){

}

Score.prototype = {
	load: function(callback){
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: window.location.origin + '/users.json',
			success: callback
		});
	}
}