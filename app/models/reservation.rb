class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validate :check_overlapping_dates
  validate :check_max_guests
  validate :check_num_guests
  # validate start_date should be after today(to do!)

  def check_num_guests
    if num_guests > 0
      return true
    else
      errors.add(:num_guests, "Number of guests cannot be negative")
      return false
    end
  end

  def check_max_guests
    max_guests = listing.capacity
    if num_guests <= max_guests
      return true
    else
      errors.add(:max_guests, "Max guests number exceeded")
      return false
    end
  end

  def overlap?(x,y)
    (x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
  end

  def check_overlapping_dates
    #compare this new booking against existing bookings
  self.listing.reservations.each do |old_reservation|
    if overlap?(self, old_reservation)
      return errors.add(:overlapping_dates, "Your reservation dates conflict with existing reservations")
      end
    end
  end

end
