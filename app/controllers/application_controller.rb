class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_current_user
    private
    def set_current_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end

end
