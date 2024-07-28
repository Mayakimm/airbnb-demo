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

  def show
    @booking = Booking.find(params[:id])
    @flat= @booking.flat
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.destroy
      redirect_to user_path(current_user), notice: 'Booking has been canceled successfully! :D'
    else
      redirect_to booking_path(@booking), alert: 'Failed to cancel your booking.'
    end
  end
  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :flat_id)
  end
end
