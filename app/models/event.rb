class Event < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants

  validates :name, :date, :location, :state, presence: true
  validates_date :date, :on_or_after => :today, notice: "Please enter a valid date"
end
