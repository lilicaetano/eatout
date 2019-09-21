class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :meeting
  has_one :chat_room, dependent: :destroy
end
