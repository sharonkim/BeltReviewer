class ParticipantsController < ApplicationController
    def create
        @participant = Participant.new
        @event = Event.find_by( :event_id )
        @participant.event = @event
        @participant.user = current_user

        unless @participant
            flash[ :errors ] = @participant.errors.full_messages
            redirect_to events_index_path
        end
    end

    def destroy
        @event = Event.find_by( :event_id )
        @participant = Participant.destroy.where(participant_params)
        redirect_to events_index_path
    end

    private
        def participant_params
            params.require(:participant).permit(:event_id).merge(user: current_user)
        end
end
