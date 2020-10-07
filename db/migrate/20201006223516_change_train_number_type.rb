class ChangeTrainNumberType < ActiveRecord::Migration[6.0]
  def change
    change_column :trains, :number, :string
    # rails db:migrate:up VERSION=20201006220244
  end
end
