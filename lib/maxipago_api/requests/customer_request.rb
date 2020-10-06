require 'httparty'
require 'active_support'
require "active_support/core_ext"
module MaxipagoApi
  class CustomerRequest
    include HTTParty
    class << self
      def create(customer)
        xml = {
            'verification' => {merchantId: MaxipagoApi.store_id, merchantKey: MaxipagoApi.store_key}, 
            command: 'add-consumer', 
            request: customer.to_object
          }.to_xml(root: 'api-request')
        response = post(MaxipagoApi.api_register_endpoint, body: xml, headers: {'Content-Type' => 'text/plain'})
        Hash.from_xml(response.parsed_response)
      end
    end
  end
end