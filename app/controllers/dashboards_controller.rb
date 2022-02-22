class DashboardsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @flats = Flat.where(user: current_user)
    @user_info = User.where(user: current_user)
  end
end
