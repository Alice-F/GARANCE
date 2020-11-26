class Stock < ApplicationRecord
  belongs_to :product
  belongs_to :size
  has_one :brand, through: :product
  has_one :category, through: :product

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :product, presence: true
  validates :size, presence: true
  validates_uniqueness_of :size_id, scope: [:product_id]
end
