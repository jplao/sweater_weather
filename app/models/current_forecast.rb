class CurrentForecast
  def initialize(data)
    @icon = data[:currently][:icon]
    @current_temp = data[:currently][:temperature]
    @current_summary = data[:currently][:summary]
    @feels_like = data[:currently][:apparentTemperature]
    @humidity = data[:currently][:humidity]
    @visibility = data[:currently][:visibility]
    @uvindex = data[:currently][:uvIndex]
    @high = data[:daily][:data][0][:temperatureHigh]
    @low = data[:daily][:data][0][:temperatureLow]
  end
end
