class GeocodeService
  def initialize(location)
    @location = location
  end

  def get_data
    to_json("json?address=#{@location}&key=#{ENV['GOOGLE_API_KEY']}")
  end

  def get_coords
    get_data[:results][0][:geometry][:location]
  end

  private
    attr_reader :location

    def conn
      Faraday.new("https://maps.googleapis.com/maps/api/geocode/")
    end

    def to_json(url)
      JSON.parse(conn.get(url).body, symbolize_names: true)
    end
end
