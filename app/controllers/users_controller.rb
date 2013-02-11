class UsersController < ApplicationController
	def new
		if current_user
			redirect_to pages_welcome_url
		else
			@user = User.new
		end
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			session[:user_id] = @user.id
			#redirect after login
			redirect_to pages_welcome_url, notice: "You're Lonely no more!"
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end
end
