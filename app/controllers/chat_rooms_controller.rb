class ChatRoomsController < ApplicationController
  def index
    @meetings = Meeting.where(user: current_user)
    @user_guest = Guest.where(user: current_user)
    @chat_rooms = []
    @user_guest.each do |guest|
      @chat_rooms << ChatRoom.find_by(guest: guest)
    end
    @meetings.each do |meeting|
      guestCheck = ChatRoom.find_by(guest: Guest.find_by(meeting: meeting))
      unless guestCheck.nil?
        @chat_rooms << guestCheck
      end
    end

  end

  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
  end
end
