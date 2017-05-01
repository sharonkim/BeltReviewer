require 'rails_helper'

RSpec.describe Participants, type: :model do
    describe 'relationships' do
        before do
            @user = create(:user)
            @event = create(:event)
            @participant = create(:join, event: @event, user: @user)
        end

        it 'belongs to a user' do
            expect(@participant.user).to eq(@user)
        end

        it 'belongs to an event' do
            expect(@participant.event).to eq(@event)
        end
    end
end
