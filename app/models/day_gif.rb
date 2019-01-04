class DayGif
  def initialize(summary, time)
    @summary = summary
    @time = time
    @url = []
    @source = []
    load_url
    load_source
  end

  def load_gif_data
    @gif_data ||= GiphyService.new(@summary).get_gifs
  end

  def load_url
    @url = load_gif_data[:data][0][:url]
  end

  def load_source
    @source = load_gif_data[:data][0][:source_tld]
  end

end
