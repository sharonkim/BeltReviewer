require 'rails_helper'

RSpec.describe User, type: :model do
    context "with valid attributes" do

        it "should save" do
            expect(build(:user)).to be_valid
        end

        it "should automatically encrypt the password" do
            expect(build(:user).password.digest).to eq(true)
        end

        it "should downcase email" do
            expect(create(:user, email: 'EMAIL@EMAIL.COM').email).to eq('email@email.com')
        end
    end

    context "with invalid attributes" do

        it "should not save" do
            expect(build(:user)).to be_invalid
        end

        it "cannot have blank name nor email" do
            expect(build(:user, first_name: '')).to be_invalid
            expect(build(:user, last_name: '')).to be_invalid
            expect(build(:user, email: '')).to be_invalid
        end

        it "cannot have invalid email formatt" do
            emails = %w[@ user@ @email.com]
            emails.each do |email|
                expect(build(:user, email: email)).to be_invalid
        end

        it "cannot not have an email that already exists" do
            create(:user)
            expect(build(:user)).to be_valid
        end

        it "cannot have blank password" do
            expect(build(:user, password: '')).to be_invalid
        end

        it "should have matching password and confirmation password" do
            expect(build(:user, password_confirmation: 'different_password')).to be_invalid
        end
    end
end
