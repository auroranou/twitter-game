class Tweeter < ActiveRecord::Base
	validates :name, :username, :follower_count, presence: true
end
