class AddTicketsData < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :user_id, :integer
    add_column :tickets, :train_id, :integer
    add_column :tickets, :start_station_id, :integer
    add_column :tickets, :end_station_id, :integer

    add_index :tickets, :user_id
    add_index :tickets, :train_id
    add_index :tickets, %i[start_station_id end_station_id]
  end
end
