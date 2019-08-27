class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :guests
end
