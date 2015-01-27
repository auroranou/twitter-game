require 'test_helper'


  describe Tweeter do
  	test "should not save tweeter without tweetID" do
  		tweeter = Tweeter.new
  		assert_not tweeter.save
  	end
  end
  	
  # test "the truth" do
  #   assert true
  # end

