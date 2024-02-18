class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :bookings


  validates :password, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
end
