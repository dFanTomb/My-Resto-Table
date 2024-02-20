class Restaurant < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :users

  validates :name, :address, :city, :postal_code, presence: true
end
