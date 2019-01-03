class Forecast
  attr_reader :location

  def initialize(data)
    @location = data['location']
  end
end
