class User < ApplicationRecord
  attr_reader :api_key

  before_create :create_activation_digest
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password

  def create_activation_digest
    self.api_key = SecureRandom.urlsafe_base64
  end
end
