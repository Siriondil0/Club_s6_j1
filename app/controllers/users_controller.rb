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
		unless session[:user_id]
			redirect_to '/users', flash: {notice: "Accès interdit au profil quand non conecté"}
		end
	end
	
	def edit 
		@current_user = User.find(params[:id])
		unless session[:user_id] == @current_user.id
			if session[:user_id]
				redirect_to '/club', flash: {notice: "Accès interdit à l'édition du profil des autres"}
			else
				redirect_to '/users', flash: {notice: "Accès interdit au profil quand non connecté"}
			end 
		end
	end

	def update
		@current_user = User.find(params[:id])
		@current_user = @current_user.update_attributes(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email])
		if @current_user
			flash[:notice]= "Vous avez bien modifié votre profil"
			redirect_to '/club'
		else
			flash[:notice]= "Accès interdit au profil quand non connecté"
			redirect_to '/users/' + params[:id].to_s + '/edit' 
		end
	end
end
