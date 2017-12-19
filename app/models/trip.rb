class Trip < ApplicationRecord
  has_many :destinations, through: :routes
end
