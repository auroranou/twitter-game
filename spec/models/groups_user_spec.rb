require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe GroupsUser, :type => :model do
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:group_id)}
end
