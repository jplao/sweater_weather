# Sweater Weather

This app consumes APIs from Google GeoCode and DarkSky to render weather forecast data in json format for given locations and user favorited locations.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

From GitHub clone down repository using the following commands in terminal:
* git clone git@github.com:jplao/sweater_weather.git
* cd sweater_weather

### Prerequisites

You will need Rails installed and verify that it is version 5.2

To check your version using terminal run: rails -v in the command line.
If you have not installed rails, in terminal run: gem install rails -v 5.2 in the command line.


### Installing

This app requires a few keys.

You can sign up for a Google API key here: https://cloud.google.com/maps-platform/
You can sign up for a Dark Sky API key here: https://darksky.net/dev/register

Open terminal and run these commands:
* bundle
* bundle update
* figaro install
* in your config/applicaion.yml file add your keys with these names:

  * GOOGLE_API_KEY:
  * DARK_SKY_API_KEY:

* rails db:{create,migrate,seed}


### Using the App

#### Endpoints
To view these endpoints run your server using the command: `rails s`


1. Weather for a City - api/v1/forecast

A user can query this endpoint with a location to show the forecast for that city.

example request:
````
GET localhost:3000/api/v1/forecast?location=denver,co
````

example response:

````json
{
    "data": {
        "id": "1",
        "type": "forecast",
        "attributes": {
            "location": "denver,co",
            "time": " 8:17AM 01/2019",
            "today": {
                "icon": "clear-day",
                "current_temp": 31.28,
                "current_summary": "Clear",
                "feels_like": 27.98,
                "humidity": 0.49,
                "visibility": 8.15,
                "uvindex": 0,
                "high": 51.65,
                "low": 26.09
            },
            "hourly": [
                {
                    "hour": " 9AM",
                    "temp": 33.33,
                    "icon": "clear-day"
                },
                {
                    "hour": "10AM",
                    "temp": 38.76,
                    "icon": "clear-day"
                },
                {
                    "hour": "11AM",
                    "temp": 43.27,
                    "icon": "clear-day"
                },
                {
                    "hour": "12PM",
                    "temp": 47.22,
                    "icon": "partly-cloudy-day"
                },
                {
                    "hour": " 1PM",
                    "temp": 50,
                    "icon": "clear-day"
                },
                {
                    "hour": " 2PM",
                    "temp": 51.65,
                    "icon": "partly-cloudy-day"
                },
                {
                    "hour": " 3PM",
                    "temp": 51.1,
                    "icon": "partly-cloudy-day"
                },
                {
                    "hour": " 4PM",
                    "temp": 48.46,
                    "icon": "partly-cloudy-day"
                }
            ],
            "five_day": [
                {
                    "day": "Wednesday",
                    "icon": "partly-cloudy-day",
                    "rain_chance": 0,
                    "high": 51.59,
                    "low": 29.69
                },
                {
                    "day": "Thursday",
                    "icon": "partly-cloudy-night",
                    "rain_chance": 0,
                    "high": 56.36,
                    "low": 32.17
                },
                {
                    "day": "Friday",
                    "icon": "snow",
                    "rain_chance": 0.54,
                    "high": 37.76,
                    "low": 26.8
                },
                {
                    "day": "Saturday",
                    "icon": "partly-cloudy-day",
                    "rain_chance": 0.12,
                    "high": 39.92,
                    "low": 22.69
                },
                {
                    "day": "Sunday",
                    "icon": "partly-cloudy-day",
                    "rain_chance": 0,
                    "high": 43.43,
                    "low": 23.54
                }
            ]
        }
    }
}
````

2. Create an account - api/v1/users

A user can create an account in our system by sending their data through the body of their request and will get a generated api key as a response.

example request:
````
POST localhost:3000/api/v1/users

body_form_data:
{
  "email": "whatever@example.com",
  "password": "password"
  "password_confirmation": "password"
}
````

example response:
````json
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "api_key": "7yjVxfqoCLs1pYC82-lKsA"
        }
    }
}
````

3. Login - api/v1/sessions

A user can log into their account using the email and password they used to create their account and will get their api key as a response.

example request:
````
POST localhost:3000/api/v1/sessions

body_form_data:
{
  "email": "whatever@example.com",
  "password": "password"
}
````

example response:
````json
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "api_key": "7yjVxfqoCLs1pYC82-lKsA"
        }
    }
}
````

4. Favoriting Locations - /api/v1/favorites

Using their generated API key, a user can add locations to their favorited locations.

example request:
````
POST localhost:3000/api/v1/favorites

body_form_data:
{
  "location": "Denver, CO",
  "api_key": "7yjVxfqoCLs1pYC82-lKsA"
}
````

example response:
````json
{
    "data": {
        "id": "1",
        "type": "favorite",
        "attributes": {
            "location": "denver, co"
        }
    }
}
````

5. Listing Favorite Locations - /api/v1/favorites

Using their API key, a user can generate a list of their favorited locations that includes the current weather for those cities.

example request:
````
GET localhost:3000/api/v1/favorites

body_form_data:
{
  "api_key": "7yjVxfqoCLs1pYC82-lKsA"
}
````

example response:
````json
{
    "data": {
        "id": "1",
        "type": "user_favorites",
        "attributes": {
            "fav_cities_weather": [
                {
                    "data": {
                        "id": 1,
                        "location": "denver,co",
                        "user_id": 1
                    },
                    "city": "denver,co",
                    "current_weather": [
                        {
                            "icon": "clear-day",
                            "current_temp": 31.61,
                            "current_summary": "Clear",
                            "feels_like": 27.95,
                            "humidity": 0.48,
                            "visibility": 8.86,
                            "uvindex": 0,
                            "high": 51.65,
                            "low": 26.09
                        }
                    ]
                },
                {
                    "data": {
                        "id": 2,
                        "location": "golden,co",
                        "user_id": 1
                    },
                    "city": "golden,co",
                    "current_weather": [
                        {
                            "icon": "clear-day",
                            "current_temp": 33.63,
                            "current_summary": "Clear",
                            "feels_like": 33.63,
                            "humidity": 0.44,
                            "visibility": 9.36,
                            "uvindex": 0,
                            "high": 51.21,
                            "low": 28.08
                        }
                    ]
                }
            ]
        }
    }
}
````


## Running the tests

* Note: Before running RSpec, ensure you're in the project root directory.

From terminal run: bundle exec rspec

After RSpec has completed, you should see all tests passing as GREEN.  Any tests that have failed or thrown an error will display RED.  Any tests that have been skipped will be displayed as YELLOW.

You can see all the tests by viewing the spec folder.  

#### Request tests
Tests found in `/requests/api/v1` test to make sure endpoints display expected data correctly.

example test:
````ruby
require 'rails_helper'

describe 'as a user' do
  it 'gets forcast data for a queried city' do
    city = "denver,co"
    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(forecast).to have_key(:location)
    expect(forecast).to have_key(:time)
    expect(forecast).to have_key(:today)
    expect(forecast).to have_key(:hourly)
    expect(forecast[:hourly].count).to eq(8)
    expect(forecast).to have_key(:five_day)
    expect(forecast[:five_day].count).to eq(5)
  end
end

````

#### Service tests
Tests found in `/services` test to make sure services from outside APIs are working correctly and output the correct expected data.
````ruby
require 'rails_helper'

describe 'google geocode service' do
  before(:each) do
    @service = GeocodeService.new('denver, co')
  end

  it 'exists' do
    expect(@service).to be_an_instance_of(GeocodeService)
  end

  context 'returns the latitude and longitude of a given location' do
    it '.get_coords' do
      expect(@service.get_coords).to eq({"lat": 39.7392358, "lng": -104.990251})
    end
  end
end
````

## Built With

* Rails
* RSpec
* ShouldaMatchers
* Capybara
* SimpleCov
* PostreSQL
* Faraday
* Figaro
* Bcrypt

## Author

* Jennifer Lao - Github: jplao
