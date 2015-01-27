require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Group, :type => :model do
  it {should validate_presence_of(:name)}
end
