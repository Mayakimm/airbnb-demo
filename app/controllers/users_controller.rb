class UsersController < ApplicationController
  def show
    @bookings = Booking.where(user: current_user)
    @upcoming_bookings = @bookings.where("start_date > ?", Date.today)
    @past_bookings = @bookings.where("start_date < ?", Date.today)
  end
end
