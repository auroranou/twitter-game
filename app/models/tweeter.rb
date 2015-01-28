class Tweeter < ActiveRecord::Base
	validates :name, :username, presence: true

	def update_attributes
		set_twitter_api
		self.followers_count = @twitter.user(self.username).followers_count
		self.creation_date = @twitter.user(self.username).created_at
		self.friends_count = @twitter.user(self.username).friends_count
		self.statuses_count = @twitter.user(self.username).statuses_count
		self.save
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