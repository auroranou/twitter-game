class StaticPagesController < ApplicationController
	before_action :authenticate_user!

	def index
		@random_question = Question.random_question
		@question = @random_question[:question]
		@first = @random_question[:first]
		@second = @random_question[:second]
		@users = User.all.sort_by{ |user| user.score }.reverse
<<<<<<< HEAD
=======
		@topscore = @users[0]
		@answer = Answer.last
>>>>>>> 9c2cfda566534596e5211a89b31dee45d289b693
		respond_to do |format|
			format.html
			format.json {render json: @random_question}
		end
	end

	def create_right_answer
		@answer = Answer.new(user_id: current_user.id, question_id: params[:id], is_correct?: true)
		redirect_to_index_after_answer
	end

	def create_wrong_answer
		@answer = Answer.new(user_id: current_user.id, question_id: params[:id], is_correct?: false)
		redirect_to_index_after_answer
	end
	
	private
	def redirect_to_index_after_answer
		if @answer.save
			redirect_to static_pages_path
		end
	end
end
