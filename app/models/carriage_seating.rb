class CarriageSeating < Carriage
  validates :seat_seats, numericality: { greater_than_or_equal_to: 1 }, presence: true
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, numericality: { equal_to: 0 }
end
