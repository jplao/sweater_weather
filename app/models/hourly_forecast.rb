class HourlyForecast
  def initialize(data)
    @hour = Time.at(data[:time]).strftime("%l%p")
    @temp = data[:temperature]
    @icon = data[:icon]
  end
end
