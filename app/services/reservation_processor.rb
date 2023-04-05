class ReservationProcessor
  def initialize(payload)
    @payload = payload.with_indifferent_access
  end

  def process
    raise NotImplementedError, 'Subclasses must implement the process method'
  end

  def create_or_update_reservation
    reservation_data = process
    guest = Guest.find_or_create_by!(email: reservation_data[:guest][:email]) do |g|
      g.assign_attributes(reservation_data[:guest])
    end

    reservation = guest.reservations.find_or_initialize_by(reservation_code: reservation_data[:reservation_code])
    reservation.assign_attributes(reservation_data.except(:guest))
    reservation.save!

    reservation
  end
end
