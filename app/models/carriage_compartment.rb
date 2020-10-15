class CarriageCompartment < Carriage
  validates :top_seats, :bottom_seats, numericality: { greater_than_or_equal_to: 1 }, presence: true
  validates :side_top_seats, :side_bottom_seats, :seat_seats, numericality: { equal_to: 0 }
end
