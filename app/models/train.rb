class Train < ApplicationRecord
  validates :number, presence: true
  validates :sort_order, inclusion: { in: [true, false] }

  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true

  has_many :tickets
  has_many :carriages, ->(train) { order("number #{train.sort_order ? 'ASC' : 'DESC'}") }

  def self.sort_order
    true
  end

  def places_counter(carriage_type, seats_type)
    carriages.where(type: carriage_type).sum(seats_type)
  end
end
