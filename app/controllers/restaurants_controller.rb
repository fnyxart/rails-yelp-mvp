class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :chef]

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def chef
    @chef = @restaurant.chef_name
  end

  # Private methods
  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def params_restaurant
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
