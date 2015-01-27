class Tweeter < ActiveRecord::Base
	validates :name, :username, :follower_count, presence: true

	def update_attributes
		set_twitter_api
		self.follower_count = @twitter.followers(self.username).count
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