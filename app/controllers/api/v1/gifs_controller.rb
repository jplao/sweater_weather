class Api::V1::GifsController < ApplicationController
  def show
    gifs = GifFacade.new(params)
    render json: gifs
  end
end
