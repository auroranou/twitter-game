class GroupsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_group, except: [:index, :new, :create]

	def index
		@groups = Group.all
		@group = Group.new
	end

	def add_user
		if current_user.groups.include?(@group)
			redirect_to @group
		else
			@groups_user = GroupsUser.create(user_id: current_user.id, group_id: params[:id], is_owner?: false)
		end
	end

	def show
		@group_users = @group.users.sort_by{ |user| user.score }.reverse
		@topscore = @group_users[0]
		respond_to do |format|
			format.html
			format.json {render json: @group_users}
		end
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			@groups_user = GroupsUser.create(user_id: current_user.id, group_id: @group.id, is_owner?: true)
			redirect_to @group
		else
			render :new
		end
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