class Favorite < ApplicationRecord
  belongs_to :flat, optional: true
  belongs_to :user, optional: true

  validates_uniqueness_of :flat_id, :scope => [:user_id]
end
