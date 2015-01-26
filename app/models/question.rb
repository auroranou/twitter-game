class Question < ActiveRecord::Base
	validates_presence_of :body
	has_many :answers
	has_many :users, through: :answers
end