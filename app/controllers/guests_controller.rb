class GuestsController < ApplicationController
  def index

  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save!
      @chat_room = ChatRoom.new(guest: @guest)
      if @chat_room.save!
        redirect_to meetings_path
      end
    end
  end

  def destroy
      @guest = Guest.find(params[:id])
      @guest.destroy
      redirect_to meetings_path
  end

  private

  def guest_params
    params.require(:guest).permit(:meeting_id, :user_id)
  end

end
