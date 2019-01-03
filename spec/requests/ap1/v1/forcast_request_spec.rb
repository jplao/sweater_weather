require 'rails_helper'

describe 'as a user' do
  it 'gets forcast data for a queried city' do
    city = "denver,co"
    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(forecast).to have_key(:location)
    expect(forecast).to have_key(:time)
    expect(forecast).to have_key(:today)
    expect(forecast).to have_key(:hourly)
    expect(forecast[:hourly].count).to eq(8)
    expect(forecast).to have_key(:five_day)
    expect(forecast[:five_day].count).to eq(5)
  end
end
