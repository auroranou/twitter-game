class StaticPagesController < ApplicationController
	before_action :authenticate_user!, :set_twitter_api
	def index	
		@question = Question.first
		@tweeters = Tweeter.all
		@tweeters = @tweeters.sort_by{rand}
		respond_to do |format|
			format.html
			format.json {render json: @tweeters}
		end
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
end
