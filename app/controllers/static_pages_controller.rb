class StaticPagesController < ApplicationController
	before_action :authenticate_user!
	#before_action :set_twitter_api, only: [:index]
	def index	
		@question = Question.all.sample
		@tweeters = Tweeter.all.sort_by{rand}
		@first = @tweeters[0]
		@second = @tweeters[1]
		@users = User.all.sort_by{ |user| user.score }.reverse
		@answer = Answer.last
		respond_to do |format|
			format.html
			format.json {render json: @answer}
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
	def set_twitter_api
		@twitter = Twitter::REST::Client.new do |config|
		  config.consumer_key = ENV['twitter_consumer_key']
		  config.consumer_secret = ENV['twitter_consumer_secret_key']
		  config.access_token = ENV['twitter_access_token']
		  config.access_token_secret = ENV['twitter_secret_access_token']
		end
	end

	def redirect_to_index_after_answer
		if @answer.save
			redirect_to static_pages_path
		end
	end
end
