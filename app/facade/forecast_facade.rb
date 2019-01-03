class ForecastFacade
  def initialize(data)
    @location = data['location']
  end

  def create_forecast
    forecast = Forecast.new(dark_sky, @location)
    forecast.load_data
    forecast
  end

  private
  def geocode
    GeocodeService.new(@location).get_coords
  end

  def dark_sky
    DarkSkyService.new(geocode).get_forecast
  end
end
