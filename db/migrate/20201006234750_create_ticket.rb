class CreateTicket < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.belongs_to :train, index: true
      t.belongs_to :start_station
      t.belongs_to :end_station
      t.belongs_to :user, index: true
    end
  end
end
