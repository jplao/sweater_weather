class Api::V1::ForecastsController < ApplicationController
  def show
    render json: Forecast.new(params)
  end
end
