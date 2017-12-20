class Destination < ApplicationRecord

  validates_presence_of :city, :state, :latitude, :longitude, :population
  has_many :routes, dependent: :destroy
  has_many :trips, through: :routes

  def self.search(term)
    dest = Destination.arel_table
    where(dest[:city].matches("%#{term}%").or(dest[:state].matches("%#{term}%")))
  end

  def self.sort_city
    order("city ASC")
  end
end
