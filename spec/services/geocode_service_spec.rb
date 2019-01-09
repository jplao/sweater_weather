require 'rails_helper'

describe 'google geocode service' do
  before(:each) do
    @service = GeocodeService.new('denver, co')
  end

  it 'exists' do
    expect(@service).to be_an_instance_of(GeocodeService)
  end

  context 'returns the latitude and longitude of a given location' do
    it '.get_coords' do
      VCR.use_cassette("geocode_data_cassette") do
        expect(@service.get_coords).to eq({"lat": 39.7392358, "lng": -104.990251})
      end
    end
  end
end
