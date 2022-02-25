class AddColumnsToFlat < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :accept_pets, :boolean, default: false
    add_column :flats, :air_con, :boolean, default: false
    add_column :flats, :kitchen, :boolean, default: false
    add_column :flats, :smoker_friendly, :boolean, default: false
    add_column :flats, :wifi, :boolean, default: false
    add_column :flats, :parking, :boolean, default: false
  end
end
