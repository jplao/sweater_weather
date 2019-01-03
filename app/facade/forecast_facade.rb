class ForecastFacade
  def initialize(data)
    @location = data['location']
  end

  def geocode
    GeocodeService.new(@location).get_coords
  end

  def dark_sky
    DarkSkyService.new(geocode).get_forecast
  end

  def create_forecast
    Forecast.new(dark_sky, @location)
  end
end
