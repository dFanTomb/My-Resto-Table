class Booking < ApplicationRecord
  belongs_to :restaurant

  validates :date, presence: true
end
