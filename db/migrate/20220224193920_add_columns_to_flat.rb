class AddColumnsToFlat < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :accept_pets, :boolean
    add_column :flats, :air_con, :boolean
    add_column :flats, :kitchen, :boolean
    add_column :flats, :smoker_friendly, :boolean
    add_column :flats, :wifi, :boolean
    add_column :flats, :parking, :boolean
  end
end
