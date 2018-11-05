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
		@current_user = User.find(params[:id])
		unless @current_user.id == session[:user_id]
			if session[:user_id]
				redirect_to '/users', flash: {notice: "Accès interdit au profil des autres"}
			else
				redirect_to '/users', flash: {notice: "Accès interdit au profil quand non conecté"}
			end
		end
  end
end
