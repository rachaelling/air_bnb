class ReservationsController < ApplicationController

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.listing = @listing
    @host = 'rachaellhe23@gmail.com'
        # ReservationMailer.reservation_email(current_user, User.find(@listing.user_id), @reservation.id).deliver_now
      if @reservation.save
        ReservationJob.perform_now(current_user.email, @host, @reservation.id)
        flash[:success] = "Reservation completed!"
        redirect_to reservation_path(current_user)
      else
        flash[:error]= @reservation.errors.full_messages
        redirect_to reservation_path(current_user)
      end
  end

  def show
    @user = User.find(params[:id])
    @reservations = @user.reservations
  end


  def destroy
  @reservation = Reservation.find(params[:id])
  # @reservation = current_user.reservations
   if @reservation.destroy
     flash[:error] = "Your booking has been canceled"
     redirect_to reservation_path(current_user)
   else
    flash[:error] = "There was a problem deleting your reservations"
    redirect_to reservation_path(current_user)
   end
  end

  def reservation_params
    params.require(:reservation).permit(:num_guests, :start_date, :end_date)
  end

end
