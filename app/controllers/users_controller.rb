class UsersController < ApplicationController
    def index
        @user = User.new
        @user = User.new( session[ :user ] ) if flash[ :errors ] != nil && session[ :user ] != nil
    end

    def create
        @user = User.new( user_params )

        if @user.valid? && ( @user.password == @user.password_confirmation )
            @user.save
            session[:user] = nil
            redirect_to users_new_path
        else
            flash[ :errors ] = @user.errors.full_messages
            session[ :user ] = @user
                if ( @user.password != @user.password_confirmation )
                    flash[ :errors ] = [ "Passwords do not match" ]
                end
            redirect_to root_path
        end
    end

    def new
    end

    def update
        @user = User.find( params[ :id ] )

        if @user.update( params[ :id ] )
            redirect_to events_index_path
        else
            flash[ :errors ] = @user.errors.full_messages
            session[ :user ] = @user
            redirect_to users_show_path
        end
    end

    def destroy
        @user = User.find(params[:id])
        redirect_to root_path
    end

    private
        def user_params
            params.require( :user ).permit( :first_name, :last_name, :email, :city, :state, :password, :password_confirmation )
        end
end
