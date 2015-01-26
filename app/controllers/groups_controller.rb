class GroupsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_group, except: :index

	def index
		@groups = Group.all
	end

	def add_user
		if current_user.groups.include?(@group)
			redirect_to @group
		else
			current_user.groups << @group
		end
	end

	def show
		@group_users = @group.users.order(score: :desc)
	end

	def new
	end

	def create

	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def set_group 
		@group = Group.find(params[:id])
	end

	def group_params
		params.require(:group).permit(:name)
	end
end