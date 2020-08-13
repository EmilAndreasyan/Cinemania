class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
     protect_from_forgery with: :exception
    # include DeviseTokenAuth::Concerns::SetUserByToken


   def current_user
     User.find_by(id: session[:user_id])
   end

   def logged_in?
    !!current_user
   end

   def require_login
      redirect_to "/login" unless logged_in?
   end
    
    helper_method :current_user, :logged_in?
end
