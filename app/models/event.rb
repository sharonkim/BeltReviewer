class Event < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :user_events
  has_many :users, :through => :user_events

  validates :name, :date, :location, presence: true
  validates :state, length: { is:2 }
  validates_date :date, :on_or_after => :today, notice: "Please enter a valid date"
end
