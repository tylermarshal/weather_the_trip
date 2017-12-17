# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Destination.destroy_all

json = ActiveSupport::JSON.decode(File.read('db/seeds/cities.json'))

json.each do |destination|
  Destination.create!(
    city: destination['city'],
    state: destination['state'],
    latitude: destination['latitude'],
    longitude: destination['longitude'],
    population: destination['population']
  )
end
