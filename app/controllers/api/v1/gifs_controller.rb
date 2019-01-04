class Api::V1::GifsController < ApplicationController
  def show
    gifs = GifFacade.new(params).create_gifs
    render json: gifs
  end
end
