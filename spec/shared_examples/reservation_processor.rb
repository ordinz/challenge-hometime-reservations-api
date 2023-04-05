RSpec.shared_examples 'a reservation processor' do
    
    describe '#create_or_update_reservation' do

    let(:processed_data) { subject.process }

    context 'when the guest does not exist' do
      it 'creates a new guest' do
        expect { subject.create_or_update_reservation }.to change(Guest, :count).by(1)
      end
    end

    context 'when the guest exists' do
      
      it 'does not create a new guest' do
        create(:guest, email: processed_data[:guest][:email])
        expect { subject.create_or_update_reservation }.not_to change(Guest, :count)
      end
    end

    context 'when the reservation does not exist' do
      it 'creates a new reservation' do
        expect { subject.create_or_update_reservation }.to change(Reservation, :count).by(1)
      end
    end

    context 'when the reservation exists' do
      let!(:existing_guest) { create(:guest, email: processed_data[:guest][:email]) }
      let!(:existing_reservation) { create(:reservation, reservation_code: processed_data[:reservation_code], guest: existing_guest) }

      it 'does not create a new reservation' do
        expect { subject.create_or_update_reservation }.not_to change(Reservation, :count)
      end
    end

  end

end
