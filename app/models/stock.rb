class Stock < ApplicationRecord
  belongs_to :product
  belongs_to :size
  has_one :brand, through: :product
  has_one :category, through: :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
