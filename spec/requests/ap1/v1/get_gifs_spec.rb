require 'rails_helper'

describe 'as a user' do
  it 'gets gif data for a queried city' do
    city = "denver,co"
    get "/api/v1/gifs?location=#{city}"

    expect(response).to be_successful

    gifs = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(gifs).to have_key(:daily_forecasts)
    expect(gifs[:daily_forecasts].count).to eq(8)
    expect(gifs[:daily_forecasts][0]).to have_key(:time)
    expect(gifs[:daily_forecasts][0]).to have_key(:summary)
    expect(gifs[:daily_forecasts][0]).to have_key(:url)
    expect(gifs).to have_key(:copywrite)
  end
end
