class GuestsController < ApplicationController
  def index

  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save!
      redirect_to meetings_path
    end
  end

  def destroy
      @guest = Guest.find(params[:id])
      @guest.destroy
      redirect_to meetings_path
  end

  def guest_params
    params.require(:guest).permit(:meeting_id, :user_id)
  end
end
