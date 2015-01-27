require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Answer, :type => :model do
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:question_id)}
end
