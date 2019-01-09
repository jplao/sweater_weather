require 'rails_helper'

describe Favorite, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:location)}
    it {should validate_uniqueness_of(:location)}
  end

  describe 'relationships' do
    it {should belong_to(:user)}
  end
end
