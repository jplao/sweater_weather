class UserFavorites
  attr_reader :id,
              :fav_cities_weather

  def initialize(favorite_data)
    @id = 1
    @favorites = favorite_data
    @fav_cities_weather = []
    city_weather
  end

  def city_weather
    @favorites.each do |fave_city_data|
      @fav_cities_weather << CityWeather.new(fave_city_data)
    end
  end
end
