class AirBnbProcessor < ReservationProcessor
  def process
    {
      reservation_code: @payload[:reservation_code],
      start_date: @payload[:start_date],
      end_date: @payload[:end_date],
      nights: @payload[:nights],
      guests: @payload[:guests],
      adults: @payload[:adults],
      children: @payload[:children],
      infants: @payload[:infants],
      status: @payload[:status],
      currency: @payload[:currency],
      payout_price: @payload[:payout_price],
      security_price: @payload[:security_price],
      total_price: @payload[:total_price],
      guest: {
        first_name: @payload.dig(:guest, :first_name),
        last_name: @payload.dig(:guest, :last_name),
        email: @payload.dig(:guest, :email),
        phone: @payload.dig(:guest, :phone)
      }
    }
  end
end
