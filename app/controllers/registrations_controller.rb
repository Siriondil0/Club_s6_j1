class RegistrationsController < ApplicationController
  
  def index 
    @user = User.new
  end
  
  def create 
    if User.where(email: params[:user][:email]).first
      redirect_to '/registrations', flash: {notice: "Email déjà utilisé"}
    else
      @user = User.create!(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/users'
    end
  end
  def show
  end

end
