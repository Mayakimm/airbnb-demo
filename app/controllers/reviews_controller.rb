class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking_id = Booking.find(params[:booking_id]).id
    if @review.save
      redirect_to flat_path(@review.booking.flat), notice: 'Review was successfully registered.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :booking_id)
  end
end
