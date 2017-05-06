class SessionsController < ApplicationController
    def index
        @user = User.new
        @user = User.new( session[ :user ] ) if flash[ :errors ] != nil && session[ :user ] != nil
    end

    def create
        @user = User.find_by_email( params[:email] ).try( :authenticate, params[ :password ] )

        if @user == nil
            flash[:errors] = ["Invalid Email or Password. Please try again."]
            redirect_to root_path
        else
            session[ :user_id ] = @user.id
            redirect_to events_index_path
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end
end
