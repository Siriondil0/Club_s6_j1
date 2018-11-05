class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_current_user
    private
    def set_current_user
      if session[:user_id]
<<<<<<< HEAD
        @user = User.find(session[:user_id])
=======
        @user_connected = User.find(session[:user_id])
>>>>>>> bb7ec02ee5091975f31e034d7ceee7ba8d81d145
      end
    end

end
