class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
      User.find(session[:current_user]) if session[:current_user]
  end

  def require_login
      if session[:user_id] == nil
          flash[:errors] = ["Please log in"]
          redirect_to :root
      end
  end
  helper_method :current_user

end
