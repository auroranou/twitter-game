class QuestionsController < ApplicationController
	def index
		@random_question = Question.random_question
		respond_to do |format|
			format.html
			format.json {render json: @random_question}
		end
	end
end