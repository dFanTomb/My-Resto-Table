class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]
  before_action :set_restaurant, only: %i[new create]

  def index
    @bookings = Booking.all.order(date: :asc)
  end

  def new
    @booking = Booking.new(restaurant: @restaurant)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.restaurant_id = params[:restaurant_id]

    if @booking.save
      redirect_to bookings_path
    else
      puts @booking.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @restaurant = @booking.restaurant
  end

  def update
    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
  end

  def booking_params
    params.require(:booking).permit(:restaurant_id, :date)
  end
end
