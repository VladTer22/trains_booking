class AddRouteIdToTrains < ActiveRecord::Migration[6.0]
  def change
    add_column :trains, :route_id, :integer
  end
end
