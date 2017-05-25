class EventsController < ApplicationController
    def index
        @events = Event.all
        @local_events = Event.where( current_user.state )
        @other_events = Event.where.not( current_user.state )
        @event = Event.new()
        @event = Event.new( session[ :event ] ) if flash[ :errors ] != nil && session[ :event ] != nil
    end

    def create
        event = Event.new( event_params )

       if event.save
           redirect_to events_show_path, id: event.id
       else
           flash[:errors] = event.errors.full_messages
           session[ :event ] = event
           redirect_to events_index_path
        end
    end

	def show
		@event = Event.find( params[ :id ] )
		@event = Event.new( session[ :event ] ) if flash [ :errors ] != nil && session[ :event ] != nil
		@comments = @event.comments.order( created_at: :desc )
	end

    def update
        event = Event.find( params[ :id ] )

        if event.update( event_params )
			event.save
		else
            flash[:errors] = event.errors.full_messages
            session[ :event ] = event
        end
            redirect_to events_show_path
    end

	def destroy
		event = Event.find( params[ :id ] )
		event.destroy if current_user == event.user
		redirect_to events_index_path
	end

    private
        def event_params
            params.require( :event ).permit( :name, :date, :location, :state )
        end
end
