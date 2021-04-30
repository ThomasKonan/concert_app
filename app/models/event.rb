class UserEvent < ApplicationRecord
  validates :artist, presence: true
  validates :location, presence: true
  validates :venue, presence: true
  validates :date, presence: true

  belongs_to :user
end
