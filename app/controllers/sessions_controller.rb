class SessionsController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def new
    end

    def create
        user = User.find_by_email(params[:user][:email])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
        else
            flash[:errors] = ["Invalid Email or Password. Please try again."]
        end
        redirect_to "/events"
    end

    def destroy
        reset_session
        redirect_to :root
    end
end
