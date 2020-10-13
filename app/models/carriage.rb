class Carriage < ApplicationRecord
  belongs_to :train

  before_validation :set_carriage_number
  validates :number, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats,
            :seat_seats, :train_id, numericality: { greater_than_or_equal_to: 1 }, presence: true
  validates :number, uniqueness: { scope: :train_id }

  default_scope { order(:number) }
  scope :econom, -> { where(type: 'CarriageEconom') }
  scope :compartment, -> { where(type: 'CarriageCompartment') }
  scope :ordered, -> { order(:number) }

  CARRIAGE_TYPE = %w[compartment econom sv seating].freeze

  def self.type_carriage
    CARRIAGE_TYPE
  end

  protected

  def set_carriage_number
    carriage_max_number = train.carriages.maximum(:number)
    carriage_max_number = 0 if carriage_max_number.nil?
    self.number = carriage_max_number + 1
  end
end
