class GifFacade
  attr_reader :id,
              :daily_forecasts

  def initialize(data)
    @id = 1
    @location = data
    @daily_forecasts = []
    create_gifs
  end

  def create_gifs
    daily_forecast.each do |day_data|
      @daily_forecasts << DayGif.new(day_data[:summary], day_data[:time])
    end
  end

  private
  def get_forecast_info
    @forecast ||= ForecastFacade.new(@location).create_forecast
  end

  def daily_forecast
    get_forecast_info.data[:daily][:data]
  end

end
