
require "rails_helper"

describe "Forecast Facade" do
  it "create a new forecast object" do
    stub_geocode_request
    stub_dark_sky_request
    location = "denver,co"
    facade = ForecastFacade.new('location' => location)
    expect(facade.create_forecast).to be_a(Forecast)
  end
end
