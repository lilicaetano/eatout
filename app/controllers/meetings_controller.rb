class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
    # add a where statement to only show meetings the User was involved in
  end

  def show
    @meeting = Meeting.find(params[:id])
  end
end
