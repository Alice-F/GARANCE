class Category < ApplicationRecord
  validates :name, presence: true, uniqness: true

  has_many_attached :photos
end
