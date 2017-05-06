class CommentsController < ApplicationController
    def create
        @event = Event.find(params[:id])
        @comment = Comment.new
        @comment = Comment.create(user: current_user, event: event, content: params[:content])

        if @comment
            redirect_to events_show_path
        else
            flash[ :errors ] = @comment.errors.full_messages
        end
    end
end
