class Forecast
  attr_reader :id,
              :location,
              :time,
              :today,
              :hourly,
              :five_day

  def initialize(data, location)
    @data = data
    @id = 1
    @location = location
    @time = Time.now.strftime('%l:%M%p %m/%Y')
    @today = []
    @hourly = []
    @five_day = []
  end

  def load_data
    load_today
    load_hourly
    load_five_day
  end
  
  private
    attr_reader :data

  def load_today
    @today = CurrentForecast.new(data)
  end

  def load_hourly
    data[:hourly][:data].first(8).each do |hour_data|
      @hourly << HourlyForecast.new(hour_data)
    end
  end

  def load_five_day
    data[:daily][:data][1..5].each do |day_data|
      @five_day << DailyForecast.new(day_data)
    end
  end
end
