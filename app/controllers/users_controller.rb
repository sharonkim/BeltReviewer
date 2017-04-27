class UsersController < ApplicationController
    before_action :require_login, except: [:new, :create]

    def create
        user = User.create(user_params)

        if user.save
            session[:user_id] = user.id
        else
            flash[:errors] = user.errors.full_messages
        end
        redirect_to "/events"
    end

    def edit
        user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])

        if user.update(params[:id])
        else
            flash[:errors] = user.errors.full_messages
        end
        redirect_to "/events"
    end

    def destroy
        user = User.find(params[:id])
        redirect_to "/events"
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
        end

        def require_login
            user_id = params[:id].to_i

            if user_id != (session[:user_id])
                redirect_to "/events"
            end
        end
end
