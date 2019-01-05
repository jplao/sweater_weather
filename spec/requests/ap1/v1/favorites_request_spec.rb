require 'rails_helper'

describe 'as a user' do
  before(:each) do
    @user = create(:user)
    @location = "Denver, CO"
  end

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
