class ReservationJob < ApplicationJob
  queue_as :default

  def perform(cust_email, host_email, reservation_id)
    ReservationMailer.reservation_email(cust_email, host_email, reservation_id).deliver_now
  end
end
