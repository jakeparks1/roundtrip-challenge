# Roundtrip Engineering Challenge [LINK](https://www.notion.so/Roundtrip-Engineering-Challenge-61ed07e1298a48e28a77e2a8c6d3e8a6)

Since the challenge was intentionally vague, the way I decided to complete it was by making a RSpec test that validated that, given a JSON fixture, the information was saved to the correct ActiveRecord models with the the appropriate associations.  The RSpec test lives at

    spec/services/insurance_webhook_handler_spec.rb

The JSON fixture lives at

    spec/support/fixtures/acme_health_webhook.json

The code that parses the JSON into the correct models is a service at:

    app/services/insurance_webhook_handler.rb

The models are `Insurance`, `Plan`, `Company`, `Insured`, and `Address`, because these were the distinctions in the API.  All relationships are has_one / belongs_to because in the JSON the sub-objects are single objects and not arrays.  However if the API changes and arrays are given (for example, now there are many `Insured` to one `Insurance`) it is trivial to change to a has_many / belongs_to.

`Address` is polymorphic because both `Company` and `Insured` have Addresses

