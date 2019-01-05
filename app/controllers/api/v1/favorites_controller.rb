class Api::V1::FavoritesController < ApplicationController
  def create
    @user = User.find_by(api_key: params[:api_key])
    @user.favorites.create(location: params[:location])
    render json: FavoriteSerializer.new(@user.favorites.last), status: 201
  end
end
