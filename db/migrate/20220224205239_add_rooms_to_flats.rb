class AddRoomsToFlats < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :rooms, :integer, default: 1
  end
end
