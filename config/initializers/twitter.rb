$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['twitter_consumer_key']
  config.consumer_secret = ENV['twitter_consumer_secret_key']
  config.access_token = ENV['twitter_access_token']
  config.access_token_secret = ENV['twitter_secret_access_token']
end