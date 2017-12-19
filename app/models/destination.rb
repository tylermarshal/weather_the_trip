class Destination < ApplicationRecord

  validates_presence_of :city, :state, :latitude, :longitude, :population
  has_many :routes
  has_many :trips, through: :routes

  def self.search(term)
    dest = Destination.arel_table
    where(dest[:city].matches("%#{term}%").or(dest[:state].matches("%#{term}%")))
  end

  def self.sort_city
    all.sort_by(&:city)
  end
end
