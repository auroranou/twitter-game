class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :groups_users, dependent: :destroy
  has_many :groups, through: :groups_users
  has_many :answers
  has_many :questions, through: :answers

  def score
  	self.answers.select{ |answer| answer.is_correct? == true }.count
  end

  def self.all_user_scores
    users = User.all.sort_by{ |user| user.score }.reverse
    a = []
    users.each do |u|
      a << {
        email: u.email,
        score: u.score
      }
    end
    return a
  end
end
