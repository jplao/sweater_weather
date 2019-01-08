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

  def show
    @user = find_by_api
    fave_cities = UserFavorites.new(@user.favorites)
    render json: UserFavoritesSerializer.new(fave_cities)
  end

  def delete
    @user = find_by_api
    favorite_to_delete = @user.favorites.find_by(location: params[:location])
    favorite_to_delete.destroy!
    render json: FavoriteSerializer.new(favorite_to_delete), status: 200
  end

  private
  def find_by_api
    User.find_by(api_key: params[:api_key])
  end
end
