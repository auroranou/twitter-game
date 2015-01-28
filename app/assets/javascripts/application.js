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

function correctAnswer() {
	var userId = $('.user').attr('id');
	var questionId = $('.question').attr('id');
	var url = '/questions/' + questionId + '/create_right_answer';
	var data = {
		'user_id': userId,
		'question_id': questionId,
		'is_correct?': true		
	}
	$.ajax({
		type: 'POST',
		dataType: 'json',
		url: url,
		data: data,
		success: function(response, status, jqXHR){
			console.log(response);
		},
		error: function(){
			console.log('error!');
		}
	});
}

function wrongAnswer() {
	var userId = $('.user').attr('id');
	var questionId = $('.question').attr('id');
	var url = '/questions/' + questionId + '/create_wrong_answer';
	var data = {
		'user_id': userId,
		'question_id': questionId,
		'is_correct?': false
	}
	$.ajax({
		type: 'POST',
		dataType: 'json',
		url: url,
		data: data,
		success: function(response, status, jqXHR){
			console.log(response);
		},
		error: function(){
			console.log('error!');
		}
	});
}

var click = 0
function most() {
  $('.answer').one('click', function(event){
    event.preventDefault();
    if(click < 1){
    	click++
	    if ( $(this).attr('id') > $(this).siblings('.answer').attr('id') ){
	      correctAnswer();
	      alert("you got it right!");
	    }
	    else {
	      wrongAnswer();
	      alert("you suck");
	    }
	    show();
  	}
  });
}

function oldestTweeter(){
	$(".answer").one('click', function(event){
		event.preventDefault();
		if(click < 1){
	    click++
			var date1 = new Date($(this).attr('id'));
			var date2 = new Date($(this).siblings('.answer').attr('id'));
			if(date1.getTime() > date2.getTime()){
				wrongAnswer();
	      alert("you suck");
	    }
	    else {
	    	correctAnswer();
	      alert("you got it right!");
	    }
	    show();
	  }
	});
}

function show() {
  $('.answer').each(function(){
    $(this).append( ' '+ $(this).attr('id') );
  });
}