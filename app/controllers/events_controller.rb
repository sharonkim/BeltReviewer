class EventsController < ApplicationController
    before_action :require_login

    def index
        user = User.find(session[:current_user])
        User.joins(:events)
        @events = Event.all
        # @local_events = Event.where([user.state])
        # @other_events = Event.where.not([user.state])
    end

    def show
        event = Event.find(params[:id])
        user = event.users
        comments = event.comments
    end

    def create
        event = Event.create(event_params)

        if event.save
            redirect_to "/events"
        else
           flash[:errors] = event.errors.full_messages
           redirect_to :back
       end
    end

    def destroy
        event = Event.find(params[:id])
        event.destroy if event.user == current_user
        redirect_to "/events"
    end

    def update
        event = Event.find(params[:id])
        if event.update(event_params)
            redirect_to "/events/#{event.id}"
        else
            flash[:errors] = event.errors.full_messages
            redirect_to :back
        end
    end

    private
        def event_params
            params.require(:event).permit(:name, :date, :location, :state).merge(user: current_user)
        end
end
