class RailwayStationRoute < ApplicationRecord
  belongs_to :railway_station, dependent: :destroy
  belongs_to :route, dependent: :destroy
end
