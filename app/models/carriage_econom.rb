class CarriageEconom < Carriage
  validates :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats,
            numericality: { greater_than_or_equal_to: 1 }, presence: true
end
