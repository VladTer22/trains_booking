class RailwayStation < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  has_many :trains, class_name: 'Train', foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes, dependent: :destroy

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_number').distinct }
  scope :ordered_by_title, -> { order('title asc') }

  def update_position(route, position, arrival_time, departure_time)
    station_route = station_route(route)
    station_route&.update(station_number: position, arrival_time: arrival_time, departure_time: departure_time)
  end

  def position_in(route)
    station_route(route).try(:station_number)
  end

  def arrival_time(route)
    railway_stations_routes.where(route: route).first.arrival_time
  end

  def departure_time(route)
    railway_stations_routes.where(route: route).first.departure_time
  end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end
end
