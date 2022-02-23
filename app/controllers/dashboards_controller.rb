class DashboardsController < ApplicationController
  skip_after_action :verify_policy_scoped

  def index
    @user = current_user
    @bookings = Booking.all
    @flats = Flat.all
  end

end
