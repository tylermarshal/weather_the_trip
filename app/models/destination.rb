class Destination < ApplicationRecord

  validates_presence_of :city, :state, :latitude, :longitude, :population
  # after_save ThinkingSphinx::RealTime.callback_for(:destination)

  def self.search(term)
    dest = Destination.arel_table
    where(dest[:city].matches("%#{term}%").or(dest[:state].matches("%#{term}%")))
  end

  def self.sort_city
    all.sort_by(&:city)
  end
end
