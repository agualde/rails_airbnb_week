class ChnageGuestsToGuests < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :guests, :integer, default: 0
  end
end
