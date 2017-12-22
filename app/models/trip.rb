require 'google_maps_service'

class Trip < ApplicationRecord
  validates_presence_of :name
  has_many :routes, -> {order "routes.created_at"}, dependent: :destroy
  has_many :destinations, through: :routes
  belongs_to :user


  def directions(origin, destination)
    GoogleMapsService::Client.new(key: ENV["gmaps_key"]).directions(
      [origin.latitude, origin.longitude], [destination.latitude, destination.longitude],
      mode: 'driving',
      alternatives: false).first[:legs].first[:duration][:value]
  end

  def forecast(destination, time)
    forecast = Faraday.get "https://api.darksky.net/forecast/#{ENV["forecast_key"]}/#{destination.latitude},#{destination.longitude},#{time.to_time.to_i}?exclude=minutely,hourly,daily,alerts"
    JSON.parse(forecast.body)["currently"]
  end

  def timezone(destination)
    timezone = Faraday.get "https://maps.googleapis.com/maps/api/timezone/json?location=#{destination.latitude},#{destination.longitude}&timestamp=#{(Time.now).to_time.to_i}&key=#{ENV["gmaps_key"]}"
    timezone_hours[JSON.parse(timezone.body)["timeZoneName"]]
  end

  def timezone_hours
    {"Pacific Standard Time" => -3600, "Mountain Standard Time" => 0, "Central Standard Time" => 3600, "Eastern Standard Time" => 7200}
  end
end
