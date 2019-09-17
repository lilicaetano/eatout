class UsersController < ApplicationController
  def show
    total_rating = 0
    @user = User.find(params[:id])

    if Review.where(user: @user).count > 0
      @ratings = Review.where(user: @user).each do |review|
        total_rating += review.rating
      end
      @average_rating = total_rating / Review.where(user: @user).count
    end
  end

  # def update
  #   @user = User.find(params[:id])
  #   @user.update(user_params)
  # end

  private
  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :interest, :photo)
  # end
end
