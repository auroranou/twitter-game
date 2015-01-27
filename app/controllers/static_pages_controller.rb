class StaticPagesController < ApplicationController
	before_action :authenticate_user!, :set_twitter_api
	def index	
		@question = Question.all.sample
		@array = [
			{username: 'katyperry', followers: 63_655_997	},
			{username: 'justinbieber', followers: 59_523_440},
			{username: 'BarackObama', followers: 53_602_922},
			{username: 'taylorswift13', followers: 51_254_478	}
		]
		@array = @array.sort_by{rand}
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
