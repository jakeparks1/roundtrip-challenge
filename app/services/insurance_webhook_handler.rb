require 'json'

class InsuranceWebhookHandler

  def self.parse(json_string)
    json = JSON.parse(json_string)
  end

end