class FlatsController < ApplicationController
  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
    @reviews = Review.joins(booking: :flat).where(bookings: { flat_id: params[:id] })
  end
end
