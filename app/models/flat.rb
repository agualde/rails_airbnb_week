class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :title, :description, :address, :capacity, :price, presence: true
  validates :capacity, numericality: { only_integer: true }
  validates :capacity, numericality: { greater_than: 0 }
  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { minimum: 10 }
  validates :description, length: { maximum: 1001 }
  validates :title, length: { minimum: 5 }
  validates :title, length: { maximum: 100 }
  validates :rooms, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
