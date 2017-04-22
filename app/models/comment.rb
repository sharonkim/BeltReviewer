class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :events

  validates :content, presence: true, length: { minimum:2 }
end
