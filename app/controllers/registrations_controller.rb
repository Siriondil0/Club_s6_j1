class RegistrationsController < ApplicationController
  
  def index 
    @user = User.new
  end
  
  def create 
    @user = User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], password: params[:user][:password])
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/users'
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to '/registrations'
    end
  end

  def show
  end

end
