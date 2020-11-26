class Size < ApplicationRecord
  has_many :stocks

  validates :name, presence: true, uniqueness: true

  default_scope { order(name: :asc) }
end
