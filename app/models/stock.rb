class Stock < ApplicationRecord
  belongs_to :product
  belongs_to :size

  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
