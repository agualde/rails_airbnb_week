class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  # validates :end_date, comparison: { greater_than: :start_date }
  # validates :start_date, comparison: { greater_than: Time.now  }
  # validates :status, collection: ["Available", "Booked", "Pending confirmation"]
end
