class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
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
