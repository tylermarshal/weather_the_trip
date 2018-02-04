# Weather the Trip

"Weather the Trip" is a CRUD application built in Ruby on Rails that helps users to plan roadtrips, see the travel time between destinations, and determine the weather in each location they visit - at the time they will be there. It allows authenticated users to create & delete one or more trips, view and search through all destinations, and add & remove destinations to & from their trips. Admins are able to create and delete new destinations. The APIs used for this application are Google Maps, Google Directions, Google Timezone, and Dark Sky Weather.

[Try it out on Heroku](https://weather-the-trip.herokuapp.com/)

[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)]()

## Setup & Installation

Fork/clone the Weather the Trip Github repository into a directory of your choosing.

```
git clone https://github.com/tylermarshal/weather_the_trip.git
```

Move into the Weather the Trip directory & bundle.

```
cd weather_the_trip
```
```
bundle install
```

From here you will need to set up the databases:

```
rails db:create db:migrate
```

Weather the Trip is populated using JSON data for the top 1000 most populous cities in the United States. This data is located in the db/seeds directory and can be seeded with the following command:

```
rails db:seed
```

You can check to ensure the data was imported correctly by entering the rails terminal and ensuring the Destination table is not blank:

```
rails c
Destination.all
```

### API Setup

Weather the Trip uses the Google Maps, Google Directions, Google Timezone, and Dark Sky Weather. You will need to acquire a Google Maps API key https://developers.google.com/maps/documentation/embed/get-api-key and a Dark Sky API key https://darksky.net/dev.

To safely add these to your project, you will need to setup Figaro:

```
bundle exec figaro install
```

In the application.yml file that Figaro created, you will need to add the following, inserting your API keys between the corresponding brackets:

```
gmaps_key: <google_maps_key>
forcast_key: <darksky_forcast_key>
```

## Testing

To run the test suite, you can execute the following in your terminal:

```
bundle exec rspec
```

## Creator
[Tyler Madsen](https://github.com/tylermarshal)

