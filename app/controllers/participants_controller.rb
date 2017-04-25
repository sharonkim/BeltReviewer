class ParticipantsController < ApplicationController
    def create
        event = Event.find(params[:id])
        Participant.create(user: current_user, event: event)
        redirect_to "/events/#{params[:id]}"
    end

    def destroy
        event = Event.find(params[:id])
        participant = Participant.where(user: current_user, event: event)
        participant.destroy_all
        redirect_to "/events"
    end
end
