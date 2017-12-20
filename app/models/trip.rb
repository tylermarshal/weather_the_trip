require 'google_maps_service'
class Trip < ApplicationRecord
  validates_presence_of :name
  has_many :routes, -> {order "routes.created_at"}
  has_many :destinations, through: :routes
  belongs_to :user


  def directions(origin, destination)
    GoogleMapsService::Client.new(key: ENV["gmaps_key"]).directions(
      [origin.latitude, origin.longitude], [destination.latitude, destination.longitude],
      mode: 'driving',
      alternatives: false).first[:legs].first[:duration][:value]/60
  end
end
