class AddFavoriteToFlats < ActiveRecord::Migration[6.1]
  def change
    add_column :flats, :favorited, :boolean, default: false
  end
end
