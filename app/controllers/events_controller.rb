class EventsController < ApplicationController
    before_action :require_login

    def index
        @event = Event.all
    end

    def create
        event = Event.new(event_params)

        if event.save
            redirect_to '/events'

        else
        end
    end

    def destroy
        if session[:user_id] == Event.find(params[:id]).user_id
        end
        redirect_to users_show_path :id => current_user.id
    end

    private
        def event_params
            params.require(:event),require(:name, :date, :city, :state)
        end
end
