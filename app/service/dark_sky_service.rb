class DarkSkyService
  def initialize(coords)
    @latitude = coords[:lat]
    @longitude = coords[:lng]
  end

  def get_forcast
    conn = Faraday.new("https://api.darksky.net/forecast/")
    response = conn.get("#{ENV['DARK_SKY_API_KEY']}/#{@latitude},#{@longitude}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
