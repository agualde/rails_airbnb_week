class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user

    if @booking.save
      redirect_to booking_show_path(@booking)
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
