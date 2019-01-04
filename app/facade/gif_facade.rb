class GifFacade
  attr_reader :id,
              :daily_forecasts,
              :copywrite

  def initialize(data)
    @id = 1
    @location = data
    @daily_forecasts = []
    @copywrite = Time.now.strftime("%Y")
    create_gifs
  end

  private
  def create_gifs
    daily_forecast.each do |day_data|
      @daily_forecasts << DayGif.new(day_data[:summary], day_data[:time])
    end
  end

  def get_forecast_info
    @forecast ||= ForecastFacade.new(@location).create_forecast
  end

  def daily_forecast
    get_forecast_info.data[:daily][:data]
  end

end
