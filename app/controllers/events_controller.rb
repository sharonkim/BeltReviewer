class EventsController < ApplicationController
    def index
        @in_state_events = Event.where(state: current_user.state)
        @other_events = Event.where.not(state: current_user.state)
        render "/events/index.html.erb"
    end

    def create
        event = Event.create(user_params)

        if event.valid?
            flash[:errors] = ["You have successfully created an event!"]
            Participant.create(user: current_user, event: event)
            redirect_to "/events"

        else
           flash[:errors] = event.errors.full_messages
           redirect_to "/"
       end
    end

    def view
        @events = Event.find(params[:id])
        @comments = Comment.where(event: @event)
        render "/events/view.html.erb"
    end

    def destroy
        event = Event.find(params[:id])
        event.destroy
        redirect_to "/events"
    end
end
