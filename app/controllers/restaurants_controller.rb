class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all

    @markers = Restaurant.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
        #infoWindow: render_to_string(partial: "infowindow", locals: { restaurant: restaurant })
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def map

  end
end
