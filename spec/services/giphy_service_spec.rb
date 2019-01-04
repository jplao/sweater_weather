require 'rails_helper'

describe 'giphy service' do
  before(:each) do
    @service = GiphyService.new("Mostly sunny in the morning.")
  end

  it 'exists' do
    expect(@service).to be_an_instance_of(GiphyService)
  end
end
