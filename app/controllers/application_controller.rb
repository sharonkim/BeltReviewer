class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
      User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
      user_id = params[:id].to_i

      if user_id != (session[:user_id])
      redirect_to users_show_path(session[:user_id])
  end

  helper_method :current_user
end
