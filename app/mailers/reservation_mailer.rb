class ReservationMailer < ApplicationMailer
  default from: 'rachaellhe23@gmail.com'
  layout 'mailer'

  def reservation_email(customer, host, reservation_id)
    @customer = customer
    @host = host
    @reservation_id = reservation_id
    mail(to: 'rachaellhe23@gmail.com', subject: 'Yay! You have received a new booking!')
  end

end
