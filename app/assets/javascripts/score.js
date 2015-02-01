var Score = function(){

}

Score.prototype = {
	load: function(){
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: window.location.origin + '/users.json',
			success: function(response){
				console.log(response)
			}
		});
	}
}