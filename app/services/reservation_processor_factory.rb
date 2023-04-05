class ReservationProcessorFactory
  def self.get_processor(payload)
    if payload.key?('reservation_code')
      AirBnbProcessor
    elsif payload.key?('reservation')
      BookingDotComProcessor
    else
      raise ArgumentError, 'Unknown payload format'
    end
  end
end
