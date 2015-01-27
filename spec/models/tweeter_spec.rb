require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Tweeter, :type => :model do
  it {should validate_presence_of(:twitter_id)}
  it {should validate_presence_of(:follower_count)}
  it {should validate_presence_of(:username)}
  	 
end
