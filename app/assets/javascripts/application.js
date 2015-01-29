// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function updateScoreboard(){
	$(".close").on("click", function(){
		$.ajax({
			type: "GET",
			dataType: "json",
			url: window.location.origin + "/users.json",
			success: function(response){
				$(".scoreboard").children().remove()
				for(var i = 0; i < response.length; i++){
					$(".scoreboard").append("<li><p>" + response[i]["email"]+ "</p><p>Score: " + response[i]["score"] + "</p><div class='bar-wrap'><span class='bar-fill' style='width: " + (response[i]["score"]/response[0]["score"]) * 100 + "%;'></span></div></li>");
				}
			},
			error: function(response){
				console.log("error");
			}
		});
	});
}

