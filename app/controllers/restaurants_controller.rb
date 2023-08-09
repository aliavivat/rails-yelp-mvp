class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    # for the form!
    @restaurant = Restaurant.new
  end

  def create
    # this does not have a view
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # give the form back again --> new.html.erb
      render :new, status: :unprocessable_entity
    end
  end

  private

  # strong params --> we are permitting only name, rating, address inputs from users
  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end
end
