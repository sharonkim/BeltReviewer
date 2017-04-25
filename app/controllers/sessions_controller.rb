class SessionsController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def new
        reset_session
        redirect_to "/sessions/new.html.erb"
    end

    def create
        if user = User.find_by_email(email: params[:email])
            if user.authenticate(params[:password])
                session[:user_id] = user.id
                flash[:notice] = ["You have successfully created a user account"]
                redirect_to "/events"

            else
                flash[:errors] = ["Invalid Email or Password. Please try again."]
                redirect_to "/"
            end
        end
    end

    def destroy
       session[:user_id] = nil
        flash[:notice] = "You have been succefully logged out."
        reset_session
        redirect_to "/"
    end
end
