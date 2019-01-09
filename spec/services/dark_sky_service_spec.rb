require 'rails_helper'

describe 'dark sky service' do
  before(:each) do
    @coords = {"lat": 39.7392358, "lng": -104.990251}
    @service = DarkSkyService.new(@coords)
  end

  it 'exists' do
    expect(@service).to be_an_instance_of(DarkSkyService)
  end

  context 'it returns forecast data' do
    it '.get_forecast' do
      VCR.use_cassette("dark_sky_data_cassette") do
        response = @service.get_forecast
        expect(response[:latitude]).to eq(@coords[:lat])
        expect(response[:longitude]).to eq(@coords[:lng])
        expect(response[:timezone]).to eq("America/Denver")
        expect(response[:currently]).to be_an_instance_of(Hash)
        expect(response[:hourly]).to be_an_instance_of(Hash)
        expect(response[:daily]).to be_an_instance_of(Hash)
      end
    end
  end

  context 'it works with Google Geocode Service' do
    it 'returns forecast data' do
      location = "denver, co"
      geocode_coords = GeocodeService.new(location).get_coords

      dark_sky_forecast = DarkSkyService.new(geocode_coords).get_forecast

      expect(dark_sky_forecast[:latitude]).to eq(@coords[:lat])
      expect(dark_sky_forecast[:longitude]).to eq(@coords[:lng])
    end
  end
end
