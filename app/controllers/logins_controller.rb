class LoginsController < ApplicationController
  
  def index 
    @current_user = User.new
  end
        
  def create
    @current_user = User.where(email: params[:user][:email]).first
    if @current_user && @current_user.authenticate(params[:user][:password])
      session[:user_id] = @current_user.id
      redirect_to '/users', flash: {notice: "Vous êtes maintenant connecté"}
    else
      session[:user_id] = nil
      puts "Echec"
      redirect_to '/logins', flash: {notice: "Échec de la connexion"}
    end
  end

  def destroy
    
  end
  def show
  end

end
