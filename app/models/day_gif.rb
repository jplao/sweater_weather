class DayGif
  def initialize(summary, time)
    @summary = summary
    @time = time
    @url = []
    load_url
  end

private
  attr_reader :gif_data

  def load_gif_data
    GiphyService.new(@summary).get_gifs
  end

  def load_url
    @url = load_gif_data[:data][0][:url]
  end

end
