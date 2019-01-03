require 'rails_helper'

describe 'as a user' do
  it 'gets forcast data for a queried city' do
    city = "denver,co"
    get "/api/v1/forecast?location=#{city}"

    expect(response).to be_successful
  end
end
