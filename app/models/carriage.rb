class Carriage < ApplicationRecord
  belongs_to :train

  before_validation :set_carriage_number

  validates :number, :type, :train, presence: true
  validates :number, uniqueness: { scope: :train_id }

  scope :ordered, -> { order(:number) }

  CARRIAGE_TYPE = %w[CarriageCompartment CarriageEconom CarriageSv CarriageSeating].freeze
  SEAT_TYPE = %i[top_seats bottom_seats side_top_seats side_bottom_seats seat_seats].freeze

  def self.type_carriage
    CARRIAGE_TYPE
  end

  def self.type_seat
    SEAT_TYPE
  end

  protected

  def set_carriage_number
    carriage_max_number = train.carriages.maximum(:number) || 0
    self.number = carriage_max_number + 1
  end
end
