class FlatsController < ApplicationController
  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
    @reviews = Review.where(flat_id: @flat.id)
  end
end
