class Destination < ApplicationRecord

  validates_presence_of :name, :city, :state, :latitude, :longitude

end
