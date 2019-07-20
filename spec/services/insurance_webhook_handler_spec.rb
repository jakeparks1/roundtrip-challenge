require 'rails_helper'

RSpec.describe InsuranceWebhookHandler do
  let(:response_body) { File.open(File.dirname(__FILE__) + '/../support/fixtures/acme_health_webhook.json').read }

  describe '' do
    it '' do
      InsuranceWebhookHandler.parse(response_body)
      insurance = Insurance.last
      plan = insurance.plan
      company = insurance.company
      insured = insurance.insured
      expect(insurance.member_number).to eq(nil)
      expect(insurance.group_number).to eq("847025-123-4567")
      expect(insurance.group_name).to eq("The Core Team")
      expect(insurance.effective_date).to eq(Date.parse("2015-01-01"))
      expect(insurance.expiration_date).to eq(Date.parse("2020-12-31"))
      expect(insurance.policy_number).to eq("656835555")
      expect(insurance.agreement_type).to eq(nil)
      expect(insurance.coverage_type).to eq(nil)
      
      expect(plan.external_id).to eq("12345")
      expect(plan.external_id_type).to eq("Payor ID")
      expect(plan.name).to eq("Deductable Plan")
      expect(plan.type).to eq(nil)

      expect(company.external_id).to eq("54321")
      expect(company.external_id_type).to eq(nil)
      expect(company.name).to eq("roundtrip (123 456)")
      expect(company.phone_number).to eq("+12223334444")
      expect(company.address.street_1).to eq("PO Box 12345")
      expect(company.address.city).to eq("Roundtrip Town")
      expect(company.address.state).to eq("RT")
      expect(company.address.postal_code).to eq("12345")
      expect(company.address.county).to eq("Health County")
      expect(company.address.country).to eq("US")

      expect(insured.identifiers).to eq([])
      expect(insured.first_name).to eq(nil)
      expect(insured.last_name).to eq(nil)
      expect(insured.ssn).to eq(nil)
      expect(insured.relationship).to eq(nil)
      expect(insured.date_of_birth).to eq(nil)
      expect(insured.sex).to eq(nil)
      expect(insured.address.street_1).to eq(nil)
      expect(insured.address.city).to eq(nil)
      expect(insured.address.state).to eq(nil)
      expect(insured.address.postal_code).to eq(nil)
      expect(insured.address.county).to eq(nil)
      expect(insured.address.country).to eq(nil)
    end
    
  end
end
