require 'rails_helper'

RSpec.describe UserEvent, type: :model do
    describe 'relationships' do
        before do
            @user = create(:user)
            @event = create(:event)
            @user_event = create(:join, event: @event, user: @user)
        end

        it 'belongs to a user' do
            expect(@user_event.user).to eq(@user)
        end

        it 'belongs to an event' do
            expect(@user_event.event).to eq(@event)
        end
    end
end
