class Forecast
  attr_reader :id,
              :location,
              :time,
              :today,
              :hourly,
              :five_day

  def initialize(data, location)
    @id = 1
    @location = location
    @time = Time.now.strftime('%l:%M%p %m/%Y')
    @today = CurrentForecast.new(data)
    @hourly = []
      data[:hourly][:data].first(8).each do |hour_data|
        @hourly << HourlyForecast.new(hour_data)
      end
    @five_day = []
    data[:daily][:data][1..5].each do |day_data|
      @five_day << DailyForecast.new(day_data)
    end
  end


end
