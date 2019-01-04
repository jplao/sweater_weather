class GiphyService
  def initialize(summary)
    @summary = summary
  end

  def get_gifs
    to_json("?api_key=#{ENV['GIPHY_API_KEY']}&q=#{@summary}")
  end

  private
    def conn
      Faraday.new("https://api.giphy.com/v1/gifs/search")
    end

    def to_json(url)
      JSON.parse(conn.get(url).body, symbolize_names: true)
    end
end
