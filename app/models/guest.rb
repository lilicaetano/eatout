class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :meeting
  has_one :guest
end
