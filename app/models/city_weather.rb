class CityWeather
  def initialize(favorite_data)
    @data = favorite_data
    @city = favorite_data[:location]
    @current_weather = []
    load_weather
  end


private
  attr_reader :data
  
  def load_weather
    @current_weather << ForecastFacade.new(data).create_forecast.today
  end
end
