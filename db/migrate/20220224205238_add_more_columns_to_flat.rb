class AddMoreColumnsToFlat < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :pool_access, :boolean
    add_column :flats, :tv, :boolean
    add_column :flats, :washer, :boolean
    add_column :flats, :luggage_drop_off, :boolean
    add_column :flats, :balcony, :boolean
  end
end
