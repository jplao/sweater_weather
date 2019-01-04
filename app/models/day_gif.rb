class DayGif
  def initialize(summary, time)
    @summary = summary
    @time = time
    @url = []
    @source = []
    load_gif_data
  end

  def load_gif_data
    conn = Faraday.new("https://api.giphy.com/v1/gifs/search")
    response = conn.get("?api_key=#{ENV['GIPHY_API_KEY']}&q=#{@summary}")
    json_response = JSON.parse(response.body, symbolize_names: true)
    @url = json_response[:data][0][:url]
    @source = json_response[:data][0][:source_tld]
  end
end
