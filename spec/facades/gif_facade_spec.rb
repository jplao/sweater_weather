require 'rails_helper'

describe 'gif_facade' do
  it 'exists' do
    location = {'location' => 'denver,co'}
    gif_facade = GifFacade.new(location)
    expect(gif_facade).to be_an_instance_of(GifFacade)
    expect(gif_facade.copywrite).to be_truthy
    expect(gif_facade.daily_forecasts.count).to eq(8)
  end
end
