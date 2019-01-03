class GeocodeService
  def initialize(location)
    @location = location
  end

  def get_coords
    conn = Faraday.new("https://maps.googleapis.com/maps/api/geocode/")
    response = conn.get("json?address=#{@location}&key=#{ENV['GOOGLE_API_KEY']}")
    json_response = JSON.parse(response.body, symbolize_names: true)
    coords = json_response[:results][0][:geometry][:location]
  end

end
