class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user

    if @booking.save
      redirect_to  flat_booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find([:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
