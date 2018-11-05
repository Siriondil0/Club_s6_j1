class UsersController < ApplicationController
	def index 
	end

	def create 
		session[:user_id] = nil
		redirect_to '/users'
	end

	def secret 
		unless session[:user_id]
			redirect_to '/users', flash: {notice: "Accès interdit au secret sans être connecté"}
		end
	end

	def show
  end
end
