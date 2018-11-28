class User < ApplicationRecord
  validates :name, presence: true
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
  has_many :pictures
  has_many :favorites, dependent: :destroy
  has_many :favorite_pictures, through: :favorites, source: :picture
end
