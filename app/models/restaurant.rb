class Restaurant < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :address, :city, :postal_code, :rating, presence: true
end
