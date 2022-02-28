class Favorite < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates_uniqueness_of :flat_id, :scope => [:user_id]
end
