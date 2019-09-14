class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.geocoded
    meetingPlaces = Restaurant.joins(:meetings).uniq

    @markers = @restaurants.map do |restaurant|
      if meetingPlaces.include?(restaurant)
          img = helpers.asset_url('green-pin.png')
          meetings_available = true
          @own_meeting = own_meeting_check(restaurant)
        else
          img = helpers.asset_url('pink-map-pin.png')
          meetings_available = false
          own_meeting = false
      end

      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        image_url: helpers.asset_url(img),
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant, meetings_available: meetings_available })
      }

    end

  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def meetings
    @restaurant = Restaurant.find(params[:id])
    @meetings = Meeting.where(restaurant: @restaurant)
  end

  private

  def own_meeting_check(restaurant)
    @user_meetings = Meeting.where(user: current_user)
    @user_guest = Guest.where(user: current_user)

    found = false
    @user_meetings.each do |meeting|
      if meeting.restaurant == restaurant
        found = true
      end
    end
    @user_guest.each do |is_guest|
      if is_guest.meeting.restaurant == restaurant
        found = true
      end
    end
    return found
  end

end
