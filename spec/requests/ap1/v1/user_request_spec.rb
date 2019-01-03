require 'rails_helper'

describe 'as a user' do
  it 'creates an account' do
    data = {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
    }

    post "/api/v1/users"
  end
end
