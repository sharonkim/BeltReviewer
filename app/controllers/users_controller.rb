class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]
    before_action :check_user, except: [:new, :create]

    def new
    end

    def create
        user = User.new(user_params)

        if user.save
            redirect_to sessions_new_path

        else
            flash[:errors] = user.errors.full_messages
            redirect_to users_new_path
        end

    def edit
    end

    def update
    end

    def login
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to sessions_new_path

        else
            flash[:errors] = ["Invalid email or password. Please try again."]
            redirect_to users_new_path
        end

    def destroy
    end

        private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
        end

        def check_user
            user_id = params[:id].to_i

            if user_id != (session[:user_id])
                redirect_to users_show_path(session[:user_id])
        end
end
