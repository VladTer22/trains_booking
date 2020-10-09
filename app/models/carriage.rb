class Carriage < ApplicationRecord
  belongs_to :train
  validates :number, :top_seats, :bottom_seats, :train_id, presence: true
end
