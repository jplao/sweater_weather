class Api::V1::ForecastsController < ApplicationController
  def show
    forecast = ForecastFacade.new(params).create_forecast
    render json: ForecastSerializer.new(forecast)
  end
end
