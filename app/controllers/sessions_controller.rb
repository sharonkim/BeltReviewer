class SessionsController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def index
    end

    def create
        user = User.find_by_email(params[:user][:email])

        if user && if user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect_to "/events"
            else
                flash[:errors] = ["Invalid Email or Password. Please try again."]
                redirect_to :back
            end
        end
    end

    def destroy
        reset_session
        redirect_to :root
    end
end
