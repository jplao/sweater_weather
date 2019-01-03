class Api::V1::ForecastsController < ApplicationController
  def show
    render json: Forecast.find(params[:location])
  end
end
