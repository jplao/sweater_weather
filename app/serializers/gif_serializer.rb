class GifSerializer
  include FastJsonapi::ObjectSerializer
  attributes :daily_forecasts
end
