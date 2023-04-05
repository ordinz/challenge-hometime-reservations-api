class ReservationsController < ApplicationController
  def create
    payload = JSON.parse(request.raw_post)
    processor_class = ReservationProcessorFactory.get_processor(payload)
    reservation_processor = processor_class.new(payload)
    reservation_processor.create_or_update_reservation

    render json: { message: 'Reservation successfully created/updated' }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
