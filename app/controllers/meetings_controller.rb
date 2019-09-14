class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.where(user: current_user)
    @user_guest = Guest.where(user: current_user)
    @any_created_or_booked = @meetings + @user_guest

  end

  def show
    @meeting = Meeting.find(params[:id])
    @guests = Guest.all
    @marker = [{
      lat: @meeting.restaurant.latitude,
      lng: @meeting.restaurant.longitude,
      image_url: helpers.asset_url('green-pin.png'),
      infoWindow: render_to_string(partial: "info_window", locals: { restaurant: @meeting.restaurant})
    }]


  end


  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save!
      redirect_to meeting_path(@meeting)
    # else
    #   render 'new'
    end
  end

  def update
    @meeting = Meeting.find(params[:id])
    respond_to do
      if @meeting.update meeting_params
      end
    end
  end

  def destroy
      @meeting = Meeting.find(params[:id])
      @meeting.destroy
      redirect_to meetings_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:restaurant_id, :user_id, :meet_time)
  end
end
