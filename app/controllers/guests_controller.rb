class GuestsController < ApplicationController
  def index

  end

  def create
    # raise
    @guest = Guest.new(guest_params)
    # @guest = Guest.new(user: User.find(params[:guest].to_i), meeting: Meeting.new(params[:meeting].to_i))
    if @guest.save!
      meeting = Meeting.find_by(id: @guest.meeting_id)
      @chat_room = ChatRoom.new(guest: @guest, name: "#{meeting.restaurant.name}, due to start at #{meeting.meet_time.strftime("%H:%M")}")
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
