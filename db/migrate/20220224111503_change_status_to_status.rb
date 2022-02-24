class ChangeStatusToStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :status, :text, default: "Pending"
  end
end
