class Destination < ApplicationRecord

  validates_presence_of :city, :state, :latitude, :longitude, :population

end
