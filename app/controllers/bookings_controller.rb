class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @markers = @bookings.geocoded.map do |booking|
      {
        lat: booking.latitude,
        lng: booking.longitude
      }
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @flat = Flat.find(params[:flat_id])
    @booking.user = current_user
    @booking.flat = @flat
    if @booking.validate_guests?
      authorize @booking
      if @booking.save
        redirect_to flat_booking_path(@flat, @booking)
      else
        render :new
      end
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking

    redirect_to dashboards_path
  end

  def accept_booking
    @booking = Booking.find(params[:id_booking])
    @booking.status = "Approved"
    authorize @booking
    @booking.save

    redirect_to dashboards_path
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :id)
  end

end
