class ParticipantsController < ApplicationController
    def create
       Participant.create(participant_params)
        redirect_to "/events"
    end

    def destroy
        participant = Participant.where(event_id: params[:id], user_id: session[:user_id])
        participant.first.destroy if session[:user_id] == participant[0].user_id
        redirect_to "/events"
    end

    private
        def participant_params
            params.require(:participant).permit(:event_id).merge(user: current_user)
        end
end
