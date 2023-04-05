require 'rails_helper'
require 'shared_examples/reservation_processor'

RSpec.describe AirBnbProcessor, type: :service do

  it_behaves_like 'a reservation processor'
  
  let(:payload) { load_fixture('airbnb_payload.json') }

  subject { described_class.new(payload) }

  describe '#process' do
    it 'returns the correct data structure' do
      result = subject.process

      expect(result).to be_a(Hash)
      expect(result[:reservation_code]).to eq(payload['reservation_code'])      
    end
  end

end
