class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create

    @review = Review.new(review_params)
    if @review.save
      redirect_to @review.user
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id)
  end
end
