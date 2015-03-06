class UsersController < ApplicationController
	def index
		@users = User.all_user_scores[0,5]
		respond_to do |format|
			format.html
			format.json {render json: @users}
		end
	end
end
