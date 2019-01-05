require 'rails_helper'

describe 'as a user' do
  before(:each) do
    @user = create(:user)
  end

  it 'saves a city to favorites' do
    location = "Denver, CO"
    post "/api/v1/favorites?location=#{location}&api_key=#{@user.api_key}"

    expect(response).to be_successful
    expect(response.status).to eq (201)
    favorites = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(favorites).to have_key(:cities)
  end
end
