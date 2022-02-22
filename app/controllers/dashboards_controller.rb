class DashboardsController < ApplicationController
  skip_after_action :verify_policy_scoped

  def index
    @user = current_user
    @bookings = Booking.where(user_id: current_user)
    @flats = Flat.where(user: current_user)
  end
end
