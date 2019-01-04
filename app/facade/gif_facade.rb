class GifFacade
  def initialize(data)
    @data = data
  end

  def create_gifs
    a = ForecastFacade.new(@data).create_forecast
  end

end
