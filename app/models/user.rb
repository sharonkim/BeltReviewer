class User < ApplicationRecord
	has_secure_password

	has_many :comments
	has_many :participants
	has_many :events
	has_many :functions, through: :participants, source: :event

	emrgx = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

	validates :first_name, :last_name, :email, :city, :state, :password, presence: true
	validates :email, uniqueness: true, format: { with: emrgx }
	validates :state, length: { is: 2 }
	validates :password, length: { minimum: 8 }, on: :create

	before_save :downcase_email

	private
		def downcase_email
			email.downcase!
	end
end
