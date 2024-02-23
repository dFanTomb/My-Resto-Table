class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.all

    # unless @restaurants = nil
      query = [:queryname, :querycity, :queryaddress]
      if query.any? { |attribute| params[attribute].present? }
        query.each do |attribute|
          if params[attribute].present?
            column_name = attribute.to_s.gsub('query', '').to_sym
            @restaurants = @restaurants.where("#{column_name} ILIKE ?", "%#{params[attribute]}%")
          end
        end
      end
    # end

  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def show
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :postal_code, :rating)
  end
end
