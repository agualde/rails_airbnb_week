class AddColumnsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :first_name, :string
    add_column :bookings, :last_name, :string
  end
end
