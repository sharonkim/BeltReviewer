class User < ApplicationRecord
	has_secure_password

	has_many :comments
	has_many :events
	has_many :events, through: :user_events

	validates :first_name, :last_name, :email, :city, :state, presence: true
	validates :email, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i }
	validates :state, length: { is:2 }
	validates :password, length: { minimum:8 }, on: :create

	before_save :downcase_email

	private
		def downcase_email
			email.downcase!
	end
end
