class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def create
        user = User.create(user_params)

        if @user.valid?
            session[:user_id] = user.id
            flash[:errors] = ["Congratulations, you have successfully created a user account!"]
            redirect_to "/events"

        else
            flash[:errors] = user.errors.full_messages
            redirect_to "/"
        end
    end

    def edit
        render "/users/edit.html.erb"
    end

    def update
        user = current_user
        user.first_name = params[:first_name]
        user.last_name = params[:last_name]
        user.email = params[:email]
        user.location = params[:location]
        user.state = params[:state]
        user.save

        if user.valid?
            flash[:errors] = ["Information has been successfully updated"]
            redirect_to "/events"

        else
            flash[:errors] = user.errors.full_messages
            redirect_to "/users/#{user.id}/edit"
        end
    end

    def destroy
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
        end

        def require_login
            user_id = params[:id].to_i

            if user_id != (session[:user_id])
                redirect_to users_show_path(session[:user_id])
            end
        end
end
