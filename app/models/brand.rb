class Brand < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  validates :description, presence: true

  has_one_attached :photo
  # has_one_attached :video

  default_scope { order(name: :asc) }
end
