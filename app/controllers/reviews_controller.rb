class ReviewsController < ApplicationController
  before_action :set_restaurant_for_review, only: [:new, :create]
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params_review)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  # Private methods
  private

  def set_restaurant_for_review
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
