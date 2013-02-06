class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			session[:user_id] = @user.id
			#redirect to user page, change it later
			redirect_to @user, notice: "You're Lonely no more!"
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end
end
