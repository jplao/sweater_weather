class DailyForecast
  def initialize(data)
    @day = Time.at(data[:time]).strftime("%A")
    @icon = data[:icon]
    @rain_chance = data[:precipProbability]
    @high = data[:temperatureHigh]
    @low = data[:temperatureLow]
  end
end
