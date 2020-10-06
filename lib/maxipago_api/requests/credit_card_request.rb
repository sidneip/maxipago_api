require 'httparty'
require 'active_support'
require "active_support/core_ext"
module MaxipagoApi
  class CreditCardRequest
    include HTTParty
    def save(credit_card)
      xml = {
        'verification' => {merchantId: MaxipagoApi.store_id, merchantKey: MaxipagoApi.store_key}, 
        command: 'add-card-onfile', 
        request: credit_card.to_object
      }.to_xml(root: 'api-request')
      response = post(MaxipagoApi.api_register_endpoint, body: xml, headers: {'Content-Type' => 'text/plain'})
    end
  end
end