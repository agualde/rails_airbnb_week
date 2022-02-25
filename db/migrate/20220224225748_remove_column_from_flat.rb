class RemoveColumnFromFlat < ActiveRecord::Migration[6.1]
  def change
    remove_column :flats, :images
  end
end
