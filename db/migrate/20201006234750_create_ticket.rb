class CreateTicket < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :number
      t.string :passenger_name
      t.string :passport_number

      t.timestamps
    end
  end
end
