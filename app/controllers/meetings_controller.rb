class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
    # add a where statement to only show meetings the User was involved in
  end

  def show
    @meeting = Meeting.find(params[:id])
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

  private

  def meeting_params
    params.require(:meeting).permit(:restaurant_id, :user_id, :meet_time)
  end
end
