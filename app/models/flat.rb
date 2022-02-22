class Flat < ApplicationRecord
  belongs_to :users
  validates :title, :description, :address, :capacity, :price, presence: true
  validates :capacity, numericality: { only_integer: true }
  validates :capacity, numericality: { greater_than: 0 }
  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than: 0 }
  validates :description, lenght: { minimum: 10 }
  validates :description, lenght: { maximum: 1001 }
  validates :title, lenght: { minimum: 5 }
  validates :title, lenght: { maximum: 100 }
end
