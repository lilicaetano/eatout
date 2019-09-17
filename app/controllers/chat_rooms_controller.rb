class ChatRoomsController < ApplicationController
  def index
    @guests = Guest.where(user: current_user)

    @chat_rooms = []
    @guests.each do |guest|
      @chat_rooms << ChatRoom.find_by(guest: guest)
    end
  end

  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
  end
end
