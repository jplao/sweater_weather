class UserFavoritesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :fav_cities_weather
end
