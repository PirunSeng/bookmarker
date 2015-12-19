class UsersController < ApplicationController
	load_and_authorize_resource

	before_action :authenticate_user!

	def index
	  @users = User.all
	end

	def new
	  @user = User.new
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	    redirect_to admin_users_path, notice: 'User is successfully created.'
	  else
	    render :new
	  end
	end

	private

	def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :role, :password, :password_confirmation)
	end

end