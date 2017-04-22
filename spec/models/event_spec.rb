require 'rails_helper'

RSpec.describe Event, type: :model do
    context "with valid attributes" do

        it "should save" do
            expect(build(:event)).to be_valid
        end
    end
end
