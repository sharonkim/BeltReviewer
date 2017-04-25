class CommentsController < ApplicationController
    def create
        event = Event.find(params[:id])
        Comment.create(user: current_user, event: event, content: params[:content])
        redirect_to "/events/#{params[:id]}"
    end
end
