class Gym < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :lat, presence: true
  validates :lon, presence: true
end
