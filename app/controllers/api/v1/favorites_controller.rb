class Api::V1::FavoritesController < ApplicationController
  def create
    if find_by_api
      @user = find_by_api
      @user.favorites.create(location: params[:location])
      render json: FavoriteSerializer.new(@user.favorites.last), status: 201
    else
      render json: 'Please try again', status: 401
    end
  end

  def find_by_api
    User.find_by(api_key: params[:api_key])
  end
end
