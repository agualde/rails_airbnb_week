class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  #before_save :validate_guests

  validates :end_date, presence: true, date: { after_or_equal_to:  :start_date}
  validates :start_date, presence: true
  validates :status, inclusion: { in: %w(Pending Approved Declined) }
  validates :guests, numericality: { only_integer: true }
  #validates :guests, numericality: { lower_than_or_equal_to: self.flat.capacity }
  #def validate_guests
  #end
end
