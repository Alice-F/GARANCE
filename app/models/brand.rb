class Brand < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true
  validates :description, presence: true

  has_many :products, dependent: :destroy

  has_one_attached :photo
  # has_one_attached :video

  default_scope { order(name: :asc) }
end
