class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :time, :today, :hourly, :five_day
end
