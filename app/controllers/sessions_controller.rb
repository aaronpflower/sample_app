class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session] [:email].downcase)
		if user && user.authenticate(params[:session] [:password])
			sign_in user
			redirect_to user
			# Signin user and redirect to user show page
		else
			flash.now[:error] = 'Invaild email/password combination' # Not quite right!
			render 'new'
		end
	end

	def destory
		sign_out
		redirect_to root_url
	end 
end


