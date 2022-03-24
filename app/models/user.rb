class User < ApplicationRecord
  has_one_attached :photo
  validates :photo, size: { between: 1.kilobyte..5.megabytes , message: 'size is too big (max 5MB)' }, content_type: ['image/png', 'image/jpeg']
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :flats, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
