class AddStationNumberToRoutes < ActiveRecord::Migration[6.0]
  def change
    add_column :railway_stations_routes, :station_number, :integer
  end
end
