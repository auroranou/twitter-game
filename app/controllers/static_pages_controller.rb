class StaticPagesController < ApplicationController
	# before_action :authenticate_user!

	def index
		@users = User.all.sort_by{ |user| user.score }.reverse[0,5]
		@topscore = @users[0]
	end
end
