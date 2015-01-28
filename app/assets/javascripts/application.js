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
			console.log('correct answer!');
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
			console.log('wrong answer!');
		},
		error: function(){
			console.log('error!');
		}
	});
}

var click = 0
function most(attr) {
  $('.answer').on('click', function(event){
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
	    showResults(attr);
      $('#next').show();
      next();
  	}
  });
}

function oldestTweeter(attr){
	$(".answer").on('click', function(event){
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
	    showResults(attr);
      $('#next').show();
      next();
	  }
	});
}

function showResults(attr) {
  $('.answer').each(function(){
  	switch(attr) {
	    case 'followers_count':
		    $(this).append(' has ' + $(this).attr('id') + ' followers');
		    break;
		  case 'friends_count':
		    $(this).append(' follows ' + $(this).attr('id'));
		    break;
		  case 'statuses_count':
		    $(this).append(' ' + $(this).attr('id') + ' tweets');
		    break;
		  case 'creation_date':
		  	var date = new Date($(this).attr('id'));
		  	$(this).append(' created on ' + date);
  	}
  });
}

function next(){
	$('#next').on('click', function(){
		$.ajax({
			type: 'GET',
			url: '/',
			dataType: 'json',
			success: function(response){
				var question_parameter = response["question"]["parameter"]
				$(".question").attr("id", response["question"]["id"])
				$(".question").html(response["question"]["body"])
				$("#quizModal div ul li").first().attr("id", response['first'][question_parameter])
				$("#quizModal div ul li").first().html(response['first']['name'] + " (@" + response['first']['username'] + ")")
				$("#quizModal div ul li").last().attr("id", response['second'][question_parameter])
				$("#quizModal div ul li").last().html(response['second']['name'] + " (@" + response['second']['username'] + ")")
				$("#next").hide()
			},
			error: function(response){
				console.log('error!');
			}
		});
		click = 0;
	});
}