class User < ApplicationRecord
	has_secure_password

	has_many :comments, :events, :user_events
	has_many :events, :through: :user_events

	validates :first_name, :last_name, :email, :city, :state, presence: true
	validates :email, uniqueness: true { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i }
	validates :state, length: { is:2 }
	validates :password, length: { minimum:8 }, on: :create
	validates :password_confirmation

	before_save :downcase_email

	private
		def downcase_email
			self.email.downcase!
	end
end
