class Flat < ApplicationRecord
  has_many_attached :photos
  validates :photos, limit: { min: 3, max: 5, message: 'must be 5' }
  validates :photos, size: { between: 1.kilobyte..5.megabytes , message: 'size is too big (max 5MB)' }, content_type: ['image/png', 'image/jpeg']

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

  has_many :favorites, dependent: :destroy
end
