class Train < ApplicationRecord
  validates :number, presence: true

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :carriages

  def carr_by_type
    carriages = {}

    Carriage.type_carriage.each do |type|
      carriages[type] = self.carriages.where(type_carriage: type).count
    end
    carriages
  end

  def places_by_type(type_carriage)
    seats = {}

    %i[top_seats bottom_seats].each do |seats_type|
      seats[seats_type] = carriages.where(type_carriage: type_carriage).sum(seats_type)
    end
    seats
  end
end
