require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Question, :type => :model do
  it {should validate_presence_of(:body)}
end
