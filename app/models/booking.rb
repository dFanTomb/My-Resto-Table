class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :date, presence: true
  validates :user_id, presence: true
end
