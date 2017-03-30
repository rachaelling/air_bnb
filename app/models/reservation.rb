class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validate :check_overlapping_dates
  validate :check_max_guests

  def check_max_guests
    max_guests = listing.capacity
    return if num_guests < max_guests
    errors.add(:max_guests, "Max guests number exceeded")
    end
  end

  def overlap?(x,y)
    (x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
  end

  def check_overlapping_dates
    #compare this new booking against existing bookings
  listing.reservations.each do |old_reservation|
    if overlap?(self, old_reservation)
      return errors.add(:overlapping_dates, "Your reservation dates conflict with existing reservations")
    end
  end



end
