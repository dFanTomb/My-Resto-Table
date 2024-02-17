class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_one_attached :photo
  has_many :bookings

  validates :user_name, :password, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
end
