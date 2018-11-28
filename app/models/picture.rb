class Picture < ApplicationRecord
  mount_uploader :image_url, PictureUploader
  validates :image_url, presence: true
  validates :sentence, length: { in: 1..2200 }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
