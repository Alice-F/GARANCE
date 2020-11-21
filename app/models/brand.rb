class Brand < ApplicationRecord
  validates :name, presence: true
  validates :photo, presence: true

  has_one_attached :photo
  # has_one_attached :video
end
