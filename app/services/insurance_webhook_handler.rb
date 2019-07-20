require 'json'

class InsuranceWebhookHandler

  def self.parse(json_string)
    entries = JSON.parse(json_string)
    entries.each do |entry|
      insurance = create_insurance(entry)
      create_plan(insurance, entry["Plan"])
      create_company(insurance, entry["Company"])
      create_insured(insurance, entry["Insured"])
    end
  end

  def self.create_insurance(entry)
    insurance = Insurance.create!({
      member_number: entry["MemberNumber"],
      group_number: entry["GroupNumber"],
      group_name: entry["GroupName"],
      effective_date: Date.parse(entry["EffectiveDate"]),
      expiration_date: Date.parse(entry["ExpirationDate"]),
      policy_number: entry["PolicyNumber"],
      agreement_type: entry["AgreementType"],
      coverage_type: entry["CoverageType"]
    })
  end

  def self.create_plan(insurance, plan_entry)
    Plan.create!({
      insurance_id: insurance.id,
      external_id: plan_entry["ID"],
      external_id_type: plan_entry["IDType"],
      name: plan_entry["Name"],
      type: plan_entry["Type"]
    })
  end

  def self.create_company(insurance, company_entry)
    company = Company.create!({
      insurance_id: insurance.id,
      external_id: company_entry["ID"],
      external_id_type: company_entry["IDType"],
      name: company_entry["Name"],
      phone_number: company_entry["PhoneNumber"]
    })
    create_address(company.id, company.class.to_s, company_entry["Address"])
  end

  def self.create_insured(insurance, insured_entry)
    insured = Insured.create!({
      insurance_id: insurance.id,
      identifiers: insured_entry["Identifiers"],
      first_name: insured_entry["FirstName"],
      last_name: insured_entry["LastName"],
      ssn: insured_entry["SSN"],
      relationship: insured_entry["Relationship"],
      date_of_birth: insured_entry["DOB"],
      sex: insured_entry["Sex"]
    })
    create_address(insured.id, insured.class.to_s, insured_entry["Address"])
  end

  def self.create_address(parent_id, parent_type, address_entry)
    Address.create!({
      addressable_id: parent_id,
      addressable_type: parent_type,
      street_1: address_entry["StreetAddress"],
      city: address_entry["City"],
      state: address_entry["State"],
      postal_code: address_entry["ZIP"],
      county: address_entry["County"],
      country: address_entry["Country"]
    })
  end

end