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
    it '.get_forcast' do
      response = @service.get_forcast
      expect(response[:latitude]).to eq(@coords[:lat])
      expect(response[:longitude]).to eq(@coords[:lng])
      expect(response[:timezone]).to eq("America/Denver")
      expect(response[:currently]).to be_an_instance_of(Hash)
      expect(response[:hourly]).to be_an_instance_of(Hash)
      expect(response[:daily]).to be_an_instance_of(Hash)
    end
  end

  context 'it works with Google Geocode Service' do
    it 'returns forecast data' do
      location = "denver, co"
      geocode_coords = GeocodeService.new(location).get_coords

      dark_sky_forcast = DarkSkyService.new(geocode_coords).get_forcast

      expect(dark_sky_forcast[:latitude]).to eq(@coords[:lat])
      expect(dark_sky_forcast[:longitude]).to eq(@coords[:lng])
    end
  end
end
