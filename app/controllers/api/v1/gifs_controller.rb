class Api::V1::GifsController < ApplicationController
  def show
    gifs = GifsFacade.new(params)
    render json: gifs
  end
end
