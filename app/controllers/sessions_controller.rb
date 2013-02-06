class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_username(params[:username])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		#redirect after login
  		#1st phase: redirect to welcome_page
  		#2nd phase: redirect to vote_page
  		redirect_to pages_welcome_url, notice: "Logged in!"
  	else
  		flash[:error] = "Wrong username or Password."
  		redirect_to root_url
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "Logged out."
  end
end
