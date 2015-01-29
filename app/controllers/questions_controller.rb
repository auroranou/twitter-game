class QuestionsController < ApplicationController
	def index
		@random_question = Question.random_question
		respond_to do |format|
			format.html
			format.json {render json: @random_question}
		end
	end

	def create_right_answer
		@answer = Answer.create(user_id: current_user.id, question_id: params[:id], is_correct?: true)
		redirect_to_index_after_answer
	end

	def create_wrong_answer
		@answer = Answer.create(user_id: current_user.id, question_id: params[:id], is_correct?: false)
		redirect_to_index_after_answer
	end

	private
	def redirect_to_index_after_answer
		if @answer.save
			redirect_to questions_path
		end
	end
end