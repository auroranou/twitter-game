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

var click;

function loadQuestion() { 
	$('.next').remove();
	$.ajax({
		type: 'GET', 
		dataType: 'json', 
		url: window.location.origin + '/questions.json',
		success: function(response) {
			var question = response['question'];
			var firstAns = response['first'];
			var secondAns = response['second'];
			$('.question').attr('id', question['id']);
			$('.question').html(question['body']);
			$('.answer:first-child').attr('id', firstAns['id']);
			$('.answer:first-child').html(firstAns['name'] + ' (@' + firstAns['username'] + ')');
			$('.answer:last-child').attr('id', secondAns['id']);
			$('.answer:last-child').html(secondAns['name'] + ' (@' + secondAns['username'] + ')');
			checkAnswer(response);
		},
		error: function(response) {
			console.log('error in loadQuestion ' + response);
		}
	});
	click = 0;
}

function checkAnswer(response) {
	var questionParam = response['question']['parameter'];
	switch(questionParam) {
		case 'followers_count':
			most();
			break;
		case 'friends_count':
			most();
			break;
		case 'statuses_count':
			most();
			break;
		case 'creation_date':
			oldest();
			break
		default:
			console.log('error in checkAnswer!');
	}
	// console.log(response);
}

function most() {
	$('.answer').on('click', function(event){
		event.preventDefault();
		if (click < 1) {
			click ++;
			if ( $(this).attr('id') > $(this).siblings('.answer').attr('id') ) {
				createAnswer('correct');
			}
			else {
				createAnswer('wrong');
			}		
		}
	});
}

function oldest() {
	$(".answer").on('click', function(event){
		event.preventDefault();
		if(click < 1) {
			click++
			var date1 = new Date($(this).attr('id'));
			var date2 = new Date($(this).siblings('.answer').attr('id'));
			if(date1.getTime() > date2.getTime()){
				createAnswer('correct');
	    }
	    else {
				createAnswer('wrong');
	    }
	  }
	});
}

function createAnswer(attr) {
	var userId = $('.user').attr('id');
	var questionId = $('.question').attr('id');
	var url = window.location.origin + '/questions/' + questionId;
	var data = {
		'user_id': userId,
		'question_id': questionId,
	}
	if (attr == 'correct') {
		url += '/create_right_answer';
		data['is_correct?'] = true
		$('.question').prepend('<p>Correct!</p>')
	}
	else {
		url += '/create_wrong_answer';
		data['is_correct?'] = false
		$('.question').prepend('<p>Wrong!</p>')
	}
	console.log(url, data);
	$.ajax({
		type: 'POST',
		dataType: 'json',
		url: url,
		data: data,
		success: function(response, status, jqXHR){
			console.log('answer created!');
		},
		error: function(response){
			console.log('error in createAnswer ' + response);
		}
	});
	next();
}

function next() {
	$('.quizDialog div').append('<button class="next">Next</button>');
	$('.next').on('click', function(event){
		loadQuestion();
	});
}