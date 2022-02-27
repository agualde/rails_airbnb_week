class Favorite < ApplicationRecord
  belongs_to :flat, optional: true
  belongs_to :user, optional: true

  validates_uniqueness_of :flats_id, :scope => [:users_id]
end
