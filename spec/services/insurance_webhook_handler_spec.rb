require 'rails_helper'

RSpec.describe InsuranceWebhookHandler do
  let(:response_body) { File.open(File.dirname(__FILE__) + '/../support/fixtures/acme_health_webhook.json').read }

  describe '' do
    it '' do
      InsuranceWebhookHandler.parse(response_body)
      #expect(Insurance.count).to eq 1
    end
    
  end
end
