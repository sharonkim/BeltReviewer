class ParticipantsController < ApplicationController
    def create
        @participant = Participant.create(participant_params)
        redirect_to "/events"
    end

    def destroy
        @participant = Participant.destroy.where(participant_params)
        redirect_to "/events"
    end

    private
        def participant_params
            params.require(:participant).permit(:event_id).merge(user: current_user)
        end
end
