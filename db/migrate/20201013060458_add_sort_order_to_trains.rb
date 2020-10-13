class AddSortOrderToTrains < ActiveRecord::Migration[6.0]
  def change
    add_column :trains, :sort_order, :boolean, default: true
  end
end
