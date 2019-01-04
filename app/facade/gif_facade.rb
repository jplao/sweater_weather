class GifFacade
  def initialize(data)
    @data = data
    @daily_forecasts = []
    create_gifs
  end

  def create_gifs
    a = ForecastFacade.new(@data).create_forecast
    daily = a.data[:daily][:data]
    daily.each do |day_data|
      @daily_forecasts << DayGif.new(day_data[:summary], day_data[:time])
    end
  end

end
