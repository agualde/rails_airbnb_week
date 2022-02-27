class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :users, null: false, foreign_key: true
      t.references :flats, null: false, foreign_key: true
      t.boolean :favorite, default: true

      t.timestamps
    end
  end
end
