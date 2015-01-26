class Group < ActiveRecord::Base
	has_many :groups_users, dependent: :destroy
	has_many :users, through: :groups_users 

	validates_presence_of :name
end