class AddFavoriteToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :favorite, :boolean, default: false
  end
end
