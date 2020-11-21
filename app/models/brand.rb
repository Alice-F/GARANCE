class Brand < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  validates :description, presence: true

  has_one_attached :photo
  # has_one_attached :video
end
