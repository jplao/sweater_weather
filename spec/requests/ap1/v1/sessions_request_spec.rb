require 'rails_helper'

describe 'as a user' do
  before(:each) do
    @params = {
      email: "whatever@example.com",
      password: "password",
    }

    @user_1 = User.create(email: @params[:email], password: @params[:password])
  end

  it 'returns api key and creates session with correct password' do

    post "/api/v1/sessions?email=#{@params[:email]}&password=#{@params[:password]}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    request_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(request_response).to have_key(:api_key)
    expect(request_response[:api_key]).to eq(@user_1.api_key)
  end

  it 'does not create session with wrong password' do
    post "/api/v1/sessions?email=#{@params[:email]}&password=wrong"

    expect(response.status).to eq(401)
    expect(response.body).to eq("Please try again")
  end
end
