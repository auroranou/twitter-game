var click;
var q;

var QuestionView = function(model){
	this.model = model;
	this.questionId = model['question']['id']
	this.questionBody = model['question']['body']
	this.questionParameter = model['question']['parameter']
	this.firstName = model['first']['name']
	this.firstUserName = model['first']['username']
	this.firstFollowers = model['first']['followers_count']
	this.firstFriends = model['first']['friends_count']
	this.firstStatuses = model['first']['statuses_count']
	this.firstCreationDate = model['first']['creation_date']
	this.secondName = model['second']['name']
	this.secondUserName = model['second']['username']
	this.secondFollowers = model['second']['followers_count']
	this.secondFriends = model['second']['friends_count']
	this.secondStatuses = model['second']['statuses_count']
	this.secondCreationDate = model['second']['creation_date']
	this.renderQuestion(this.checkAnswer.bind(this));
}

QuestionView.prototype = {
	renderQuestion: function(callback){
		$('.question').html(this.questionBody);
		$('.answer:first-child').html(this.firstName + ' (@' + this.firstUserName + ')');
		$('.answer:last-child').html(this.secondName + ' (@' + this.secondUserName + ')');
		callback(this.questionParameter);
	},
	checkAnswer: function(questionParameter){
		var self = this
		$('.answer').unbind('click');
		$('.answer').on('click', function(event){
			event.preventDefault();
			click++
			switch(questionParameter) {
				case 'followers_count':
					(self.firstFollowers > self.secondFollowers ? self.firstName : self.secondName);
					($(this).html().split(" (@")[0] == self.firstName ? self.createAnswer("right") : self.createAnswer("wrong")); 
					$('.answer:first-child').append(' has ' + self.firstFollowers + ' followers');
					$('.answer:last-child').append(' has ' + self.secondFollowers + ' followers');
					break;
				case 'friends_count':
					(self.firstFriends > self.secondFriends ? self.firstName : self.secondName);
					($(this).html().split(" (@")[0] == self.firstName ? self.createAnswer("right") : self.createAnswer("wrong"));
					$('.answer:first-child').append(' follows ' + self.firstFriends + ' people');
					$('.answer:last-child').append(' follows ' + self.secondFriends + ' people');
					break;
				case 'statuses_count':
					(self.firstStatuses > self.secondStatuses ? self.firstName : self.secondName);
					($(this).html().split(" (@")[0] == self.firstName ? self.createAnswer("right") : self.createAnswer("wrong"));
					$('.answer:first-child').append(' has ' + self.firstFriends + ' tweets');
					$('.answer:last-child').append(' has ' + self.secondFriends + ' tweets');
					break;
				case 'creation_date':
					(Date.parse(self.firstCreationDate) > Date.parse(self.secondCreationDate) ? self.firstName : self.secondName);
					($(this).html().split(" (@")[0] == self.firstName ? self.createAnswer("right") : self.createAnswer("wrong"));
					$('.answer:first-child').append(' has been on Twitter since ' + self.firstCreationDate.split(' ')[0]);
					$('.answer:last-child').append(' has been on Twitter since ' + self.secondCreationDate.split(' ')[0]);
					break;
				default: 
					console.log('error in checkAnswer!');
			}
		});
	},
	createAnswer: function(result){
		var userId = $('.user').attr('id')
		var data = {
			'user_id': userId,
			'question_id': this.questionId
		}
		if (result == 'right') {
			data["is_correct?"] = true 
		}
		else {
			data["is_correct?"] = false
		}
		$.ajax({
			type: "POST",
			dataType: "json",
			data: data,
			url: window.location.origin + "/questions/" + this.questionId + "/create_" + result + "_answer",
			success: function(response, status, jqXHR) {
				console.log(response);
				$('#next').show();
				$('#next').unbind('click');
				$('#next').on('click', function(){
					$(this).hide();
					q = new Question();
					q.load(function(response){
						newView = new QuestionView(response);
					});
				});
			},
			error: function(response){
				console.log("ERROR")
			}
		});
		$('.question').html(result + '!');
	}
}

q = new Question();
q.load(function(response){
	var newView = new QuestionView(response);
});