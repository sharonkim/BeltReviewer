class User < ApplicationRecord
	has_secure_password

	has_many :comments
	has_many :participants
	has_many :events
	has_many :events, through: :participants

	ergx = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name, :last_name, :email, :location, :state, :password, presence: true
	validates :email, uniqueness: true, format: { with: ergx }
	validates :password, length: { minimum: 8 }, on: :create

	before_save :downcase_email

	private
		def downcase_email
			email.downcase!
		end
end
