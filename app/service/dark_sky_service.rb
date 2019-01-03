class DarkSkyService
  def initialize(coords)
    @latitude = coords[:lat]
    @longitude = coords[:lng]
  end

  def get_forecast
    to_json("#{ENV['DARK_SKY_API_KEY']}/#{latitude},#{longitude}")
  end

  private
  attr_reader :latitude,
              :longitude

  def conn
    Faraday.new("https://api.darksky.net/forecast/")
  end

  def to_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
