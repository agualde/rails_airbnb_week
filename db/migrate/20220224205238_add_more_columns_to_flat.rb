class AddMoreColumnsToFlat < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :pool_access, :boolean, default: false
    add_column :flats, :tv, :boolean, default: false
    add_column :flats, :washer, :boolean, default: false
    add_column :flats, :luggage_drop_off, :boolean, default: false
    add_column :flats, :balcony, :boolean, default: false
  end
end
