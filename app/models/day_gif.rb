class DayGif
  def initialize(summary, time)
    @summary = summary
    @time = time
    @url = []
    @source = []
    load_gif_data
  end

  def load_gif_data
    gif_data = GiphyService.new(@summary).get_gifs
    @url = gif_data[:data][0][:url]
    @source = gif_data[:data][0][:source_tld]
  end
end
