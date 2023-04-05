class BookingDotComProcessor < ReservationProcessor
  def process
    reservation_payload = @payload[:reservation]
    {
      reservation_code: reservation_payload[:code],
      start_date: reservation_payload[:start_date],
      end_date: reservation_payload[:end_date],
      nights: reservation_payload[:nights],
      guests: reservation_payload[:number_of_guests],
      adults: reservation_payload.dig(:guest_details, :number_of_adults),
      children: reservation_payload.dig(:guest_details, :number_of_children),
      infants: reservation_payload.dig(:guest_details, :number_of_infants),
      status: reservation_payload[:status_type],
      currency: reservation_payload[:host_currency],
      payout_price: reservation_payload[:expected_payout_amount],
      security_price: reservation_payload[:listing_security_price_accurate],
      total_price: reservation_payload[:total_paid_amount_accurate],
      guest: {
        first_name: reservation_payload[:guest_first_name],
        last_name: reservation_payload[:guest_last_name],
        email: reservation_payload[:guest_email],
        phone: reservation_payload[:guest_phone_numbers].join(', ')
      }
    }
  end
end
