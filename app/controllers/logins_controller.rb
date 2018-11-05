class LoginsController < ApplicationController
  
  def index 
    @current_user = User.new
  end
        
  def create
    @current_user = User.where(email: params[:user][:email].downcase).first
    puts @current_user
    if @current_user && @current_user.authenticate(params[:user][:password])
      session[:user_id] = @current_user.id
      redirect_to '/club', flash: {notice: "Vous êtes maintenant connecté"}
    elsif @current_user
      session[:user_id] = nil
      puts "Pas bon mot de passe"
      redirect_to '/logins', flash: {notice: "Le mot de passe est faux, veuillez rééssayer"}
    else 
      session[:user_id] = nil
      puts "Email n'existe pas"
      redirect_to '/logins', flash: {notice: "Mauvais email, veuillez rééssayer"}
    end
  end

  def destroy
    
  end
  def show
  end

end
