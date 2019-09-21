class ChatRoomsController < ApplicationController
  def index
    @meetings = Meeting.where(user: current_user)
    @user_guest = Guest.where(user: current_user)
    # @any_created_or_booked = @meetings + @user_guest
    @chat_rooms = []
    @user_guest.each do |guest|
      @chat_rooms << ChatRoom.find_by(guest: guest)
    end
    # @meetings.each do |user|
    #   @chat_rooms << ChatRoom.find_by(guest: Guest.find_by)
    # end
  end

  def show
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
  end
end
