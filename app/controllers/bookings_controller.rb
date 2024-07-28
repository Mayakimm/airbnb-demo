class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to user_path(@booking.user), notice: 'Booking was successfully created.'
    else
      @flat = @booking.flat
      render 'flats/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :flat_id)
  end
end
