class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :end_date, presence: true, date: { after_or_equal_to:  :start_date }
  validates :start_date, presence: true
  validates :status, inclusion: { in: %w(Pending Approved Declined) }
  validates :guests, numericality: { only_integer: true }
  validates :guests, presence: true
  validates :guests, numericality: { greater_than: 0 }

  def validate_guests?
    self.guests <= self.flat.capacity
  end
end
