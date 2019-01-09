class Favorite < ApplicationRecord
  belongs_to :user
  validates :location, uniqueness: true, presence: true
end
