class AddLocationToFlats < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :location, :string
  end
end
