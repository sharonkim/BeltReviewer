class UsersController < ApplicationController
    def index
        @user = User.new
        @user = User.new( session[ :user ] ) if flash[ :errors ] != nil && session[ :user ] != nil
    end

    def create
        user = User.new( user_params )

        if user.save && ( user.password == user.password_confirmation )
            session[:user] = nil
            redirect_to events_index_path
        else
            flash[ :errors ] = user.errors.full_messages
            session[ :user ] = user
                if ( user.password != user.password_confirmation )
                    flash[ :errors ] = [ "Passwords do not match" ]
                end
            redirect_to root_path
        end
    end

    def new
    end

    def edit
	end

    def update
        user = User.find( params[ :id ] )

        if user.update( params[ :id ] )
            user.save
            redirect_to events_index_path
        else
            flash[ :errors ] = user.errors.full_messages
            session[ :user ] = user
            redirect_to users_edit_path
        end
    end

    def destroy
        user = User.find( params[ :id ] )
        if user
            user.destroy
        end
        redirect_to root_path
    end

    private
        def user_params
            params.require( :user ).permit( :first_name, :last_name, :email, :location, :state, :password, :password_confirmation )
        end
end
