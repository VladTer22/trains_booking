class RailwayStation < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :trains, class_name: 'Train', foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes, dependent: :destroy

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_number').distinct }

  def update_position(route, position)
    station_route = station_route(route)
    station_route&.update(station_number: position)
  end

  def position_in(route)
    station_route(route).try(:station_number)
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
