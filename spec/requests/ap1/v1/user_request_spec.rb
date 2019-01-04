require 'rails_helper'

describe 'as a user' do
  it 'creates an account' do
    params = {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }

    post "/api/v1/users?email=#{params[:email]}&password=#{params[:password]}&password_confirmation=#{params[:password_confirmation]}"

    expect(response).to be_successful
  end
end
