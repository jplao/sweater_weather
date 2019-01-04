class GifFacade
  def initialize(data)
    @data = data
  end

  def create_gifs
    a = ForecastFacade.new(@data).create_forecast
    daily = a.data[:daily][:data]
    daily.each do |day_data|
      DayGif.new(day_data[:summary])
    end
  end

end
