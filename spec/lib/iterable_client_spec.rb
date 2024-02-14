require 'rails_helper'
require_relative '../../lib/iterable_client'

RSpec.describe IterableClient do
  let!(:mock_response) { '{"success": true}' }

  before do
    allow_any_instance_of(IterableClient).to receive(:send_request).and_return(mock_response)
  end

  describe '#send_event' do
    it 'sends an event' do
      client = IterableClient.new
      response = client.send_event('test_event', 'user777')
      expect(response).to eq(mock_response)
    end
  end

  describe '#send_email' do
    it 'sends an email' do
      client = IterableClient.new
      response = client.send_email('test@email.com', 'Test Subject', '<p>This is a test email.</p>')
      expect(response).to eq(mock_response)
    end
  end
end
