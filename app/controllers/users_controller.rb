class UsersController < ApplicationController
	def index 
	end

	def create 
		session[:user_id] = nil
		redirect_to '/users'
	end

	def fight_club 
		@user=User.all
		unless session[:user_id]
			redirect_to '/users', flash: {notice: "Accès interdit au club sans être connecté"}
		end
	end

	def show
  end
end
