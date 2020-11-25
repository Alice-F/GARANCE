class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :products#, dependent: :destroy

  default_scope { order(name: :asc) }
end
