class ChangeUsersToUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :flats, :users_id, :user_id
    rename_column :bookings, :users_id, :user_id
    rename_column :bookings, :flats_id, :flat_id
  end
end
