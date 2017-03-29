class ReservationsController < ApplicationController

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing = @listing
      if @reservation.save
        redirect_to reservation_path(current_user)
      else
        render "listings/show"
      end
  end



  def destroy

  end

  def reservation_params
    params.require(:reservation).permit(:num_guests, :start_date, :end_date)
  end

end
