# spec/services/air_bnb_processor_spec.rb
require 'rails_helper'

RSpec.describe AirBnbProcessor, type: :service do
  let(:payload) { load_fixture('airbnb_payload.json') }


  subject { described_class.new(payload) }

  describe '#process' do
    it 'returns the correct data structure' do
      result = subject.process

      expect(result).to be_a(Hash)
      expect(result[:reservation_code]).to eq(payload[:reservation_code])
      # Add more expectations for other fields
    end
  end
end
