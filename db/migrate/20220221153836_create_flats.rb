class CreateFlats < ActiveRecord::Migration[6.1]
  def change
    create_table :flats do |t|
      t.string :title
      t.text :description
      t.string :images
      t.string :address
      t.integer :capacity
      t.integer :price
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
