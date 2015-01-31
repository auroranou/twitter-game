var click = 0;
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
		click = 0;
		callback(this.questionParameter);
	},
	checkAnswer: function(questionParameter){
		var self = this
		$('.answer').unbind('click');
		$('.answer').on('click', function(event){
			event.preventDefault();
			if(click < 1){
				click++
				switch(questionParameter) {
					case 'followers_count':
						if(self.firstFollowers > self.secondFollowers){
							var rightAnswer = self.firstName;
							console.log($(this).html().split(' (@')[0])
						}
						else {
							var rightAnswer = self.secondName;
						}
						($(this).html().split(' (@')[0] == rightAnswer ? self.createAnswer("right") : self.createAnswer("wrong")); 
						$('.answer:first-child').append(' has ' + self.firstFollowers + ' followers');
						$('.answer:last-child').append(' has ' + self.secondFollowers + ' followers');
						break;
					case 'friends_count':
						if(self.firstFriends > self.secondFriends){
							var rightAnswer = self.firstName;
						}
						else {
							var rightAnswer = self.secondName;
						}
						($(this).html().split(" (@")[0] == rightAnswer ? self.createAnswer("right") : self.createAnswer("wrong"));
						$('.answer:first-child').append(' follows ' + self.firstFriends + ' people');
						$('.answer:last-child').append(' follows ' + self.secondFriends + ' people');
						break;
					case 'statuses_count':
						if(self.firstStatuses > self.secondStatuses){
							var rightAnswer = self.firstName;
						}
						else {
							var rightAnswer = self.secondName;
						}
						($(this).html().split(" (@")[0] == rightAnswer ? self.createAnswer("right") : self.createAnswer("wrong"));
						$('.answer:first-child').append(' has ' + self.firstFriends + ' tweets');
						$('.answer:last-child').append(' has ' + self.secondFriends + ' tweets');
						break;
					case 'creation_date':
						if(Date.parse(self.firstCreationDate)  > Date.parse(self.secondCreationDate)){
							var rightAnswer = self.firstName
						}
						else {
							var rightAnswer = self.secondName
						}
						($(this).html().split(" (@")[0] == self.firstName ? self.createAnswer("right") : self.createAnswer("wrong"));
						$('.answer:first-child').append(' has been on Twitter since ' + self.firstCreationDate.split(' ')[0]);
						$('.answer:last-child').append(' has been on Twitter since ' + self.secondCreationDate.split(' ')[0]);
						break;
					default: 
						console.log('error in checkAnswer!');
				}
			}	
		});
	},
	createAnswer: function(result){
		if ($('.user').attr('id') != undefined) {
			console.log("right before ajax call")
			console.log(data)
			var userId = $('.user').attr('id')
			var data = {
				'user_id': userId,
				'question_id': this.questionId
			}
			if (result == 'right') data["is_correct?"] = true;
			else data["is_correct?"] = false;
			$.ajax({
				type: "POST",
				dataType: "json",
				data: data,
				url: window.location.origin + "/questions/" + this.questionId + "/create_" + result + "_answer",
				success: function(response, status, jqXHR) {
					console.log(response);
					this.nextQuestion();
				},
				error: function(response){
					console.log("ERROR")
				}
			});
		}
		else {
			this.nextQuestion();
		}
		$('.question').html(result + '!');
	},
	nextQuestion: function(){
		$('#next').show();
		$('#next').unbind('click');
		$('#next').on('click', function(){
			$(this).hide();
			q = new Question();
			q.load(function(response){
				newView = new QuestionView(response);
			});
		});
	}
}

q = new Question();
q.load(function(response){
	var newView = new QuestionView(response);
});