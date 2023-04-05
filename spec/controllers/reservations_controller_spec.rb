# spec/controllers/reservations_controller_spec.rb
require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do

  let(:booking_payload) { load_fixture('booking_dot_com_payload.json') }
  let(:airbnb_payload) { load_fixture('airbnb_payload.json') }

  describe 'CREATE' do

    context 'when processing an AirBnB payload' do
      it 'creates a new reservation and guest' do



        expect {
          post :create, body: airbnb_payload.to_json, as: :json
        }.to change(Reservation, :count).by(1).and change(Guest, :count).by(1)

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when processing a Booking.com payload' do
      it 'creates a new reservation and guest' do
        expect {
          post :create, body: booking_payload.to_json, as: :json
        }.to change(Reservation, :count).by(1).and change(Guest, :count).by(1)

        expect(response).to have_http_status(:ok)
      end
    end

  end

  describe 'UPDATE' do

    context 'when updating an existing AirBnB reservation' do
      let!(:guest) { create(:guest, email: airbnb_payload['guest']['email']) }
      let!(:reservation) { create(:reservation, reservation_code: airbnb_payload['reservation_code'], guest: guest) }

      it 'updates the reservation and does not create a new guest' do
        updated_payload = airbnb_payload.deep_dup
        updated_payload['status'] = 'cancelled'

        expect {
          post :create, body: updated_payload.to_json, as: :json
        }.to change(Reservation, :count).by(0).and change(Guest, :count).by(0)

        reservation.reload
        expect(reservation.status).to eq('cancelled')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when updating an existing Booking.com reservation' do
      let!(:guest) { create(:guest, email: booking_payload['reservation']['guest_email']) }
      let!(:reservation) { create(:reservation, reservation_code: booking_payload['reservation']['code'], guest: guest) }

      it 'updates the reservation and does not create a new guest' do
        updated_payload = booking_payload.deep_dup
        updated_payload['reservation']['status_type'] = 'cancelled'

        expect {
          post :create, body: updated_payload.to_json, as: :json
        }.to change(Reservation, :count).by(0).and change(Guest, :count).by(0)

        reservation.reload
        expect(reservation.status).to eq('cancelled')
        expect(response).to have_http_status(:ok)
      end
    end
        
  end

end
