require 'rails_helper'

describe 'as a user' do
  before(:each) do
    @user = create(:user)
    @location = "Denver, CO"
  end

  context 'creates favorites' do
    it 'saves a city to favorites' do
      post "/api/v1/favorites?location=#{@location}&api_key=#{@user.api_key}"

      expect(response).to be_successful
      expect(response.status).to eq (201)
      favorites = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
      expect(favorites).to have_key(:location)
      expect(@user.favorites.count).to eq(1)
    end

    it 'does not save favorite with wrong api key' do
      post "/api/v1/favorites?location=#{@location}&api_key=wrong"

      expect(response.status).to eq(401)
      expect(response.body).to eq("Please try again")
    end

    it 'does not save favorite with no api key' do
      post "/api/v1/favorites?location=#{@location}"

      expect(response.status).to eq(401)
      expect(response.body).to eq("Please try again")
    end
  end

  context 'lists favorites' do
    it 'returns forecasts for users favortied cities' do
      @user.favorites.create(location: @location)
      @user.favorites.create(location: 'Golden, CO')

      get "/api/v1/favorites?api_key=#{@user.api_key}"

      expect(response).to be_successful
      expect(response.status).to eq (200)


      favorites = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:fav_cities_weather]
      expect(favorites.count).to eq(2)
      expect(favorites[0]).to have_key(:city)
      expect(favorites[0]).to have_key(:current_weather)
      expect(favorites[0][:city]).to eq(@location)
      expect(favorites[1][:city]).to eq('Golden, CO')
    end

    it 'does not list favorites with wrong api key' do
      get "/api/v1/favorites?api_key=wrong"

      expect(response.status).to eq(401)
      expect(response.body).to eq("Please try again")
    end

    it 'does not list favorites with no api key' do
      get "/api/v1/favorites"

      expect(response.status).to eq(401)
      expect(response.body).to eq("Please try again")
    end
  end

  context 'deletes a favorite city' do
    it 'deletes a user favorited city' do
      @user.favorites.create(location: @location)
      @user.favorites.create(location: 'Golden, CO')
      expect(@user.favorites.count).to eq(2)

      delete "/api/v1/favorites?api_key=#{@user.api_key}&location=#{@location}"

      expect(response).to be_successful
      expect(response.status).to eq (200)
      expect(@user.favorites.count).to eq(1)
      deleted = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
      expect(deleted).to have_key(:location)
      expect(deleted[:location]).to eq(@location)
    end

    it 'does not delete favorite with wrong api key' do
      delete "/api/v1/favorites?api_key=wrong"

      expect(response.status).to eq(401)
      expect(response.body).to eq("Please try again")
    end

    it 'does not delete favorite with no api key' do
      delete "/api/v1/favorites"

      expect(response.status).to eq(401)
      expect(response.body).to eq("Please try again")
    end
  end
end
