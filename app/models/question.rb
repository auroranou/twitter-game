class Question < ActiveRecord::Base
	validates_presence_of :body
	has_many :answers
	has_many :users, through: :answers

	def self.random_question
		question = Question.all.sample
		tweeters = Tweeter.all.sort_by{rand}
		first = tweeters[0]
		second = tweeters[1]
		return {question: question, first: first, second: second}
	end
end