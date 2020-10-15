class CarriageSeating < Carriage
  validates :seat_seats, numericality: { greater_than_or_equal_to: 1 }, presence: true
end
