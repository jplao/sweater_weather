class ForecastFacade
  def initialize(data)
    @location = data['location']
  end

  def create_forecast
    Forecast.new(dark_sky, @location)
  end

  private
  def geocode
    @geo ||= GeocodeService.new(@location).get_coords
  end

  def dark_sky
    @darksky ||= DarkSkyService.new(geocode).get_forecast
  end
end
