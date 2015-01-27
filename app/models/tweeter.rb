class Tweeter < ActiveRecord::Base
	validates :username, :twitter_id, :follower_count, presence: true
end
