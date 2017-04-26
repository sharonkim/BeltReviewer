class Event < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants

  validates :name, :date, :location, :state, presence: true
  validates :state, length: { is:2 }
  validates :date, :on_or_after => :today, notice: "Please enter a valid date"
end
