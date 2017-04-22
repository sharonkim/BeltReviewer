class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def new
    end

    def create
        @user = User.find_by_email(params[:email])

        if user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to 'users/#{@user.id}', notice "You have successfully created a user account"

        else
            flash[:errors] = ["Invalid Email or Password. Please try again."]
            redirect_to '/sessions/new'
    end

    def destroy
        reset_session
        redirect_to '/sessions/new'
    end
end
