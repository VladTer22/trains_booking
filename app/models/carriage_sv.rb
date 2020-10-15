class CarriageSv < Carriage
  validates :bottom_seats, numericality: { greater_than_or_equal_to: 1 }, presence: true
end
