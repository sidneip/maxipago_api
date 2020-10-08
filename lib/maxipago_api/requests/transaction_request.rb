require 'httparty'
require 'active_support'
require "active_support/core_ext"
module MaxipagoApi
  class TransactionRequest
    include HTTParty
    
    class << self
      def create(transaction)
        xml = {
          'verification' => {merchantId: MaxipagoApi.store_id, merchantKey: MaxipagoApi.store_key}, 
          version: '3.1.1.15',
          order: transaction.to_object
        }.to_xml(root: 'transaction-request', skip_types: true)
        response = post(MaxipagoApi.api_transaction_endpoint, body: xml, headers: {'Content-Type' => 'text/plain'})
        Hash.from_xml(response.parsed_response)
      end

      def find(id)
        xml = {
          'verification' => {merchantId: MaxipagoApi.store_id, merchantKey: MaxipagoApi.store_key}, 
          command: 'transactionDetailReport',
          request: {
            filterOptions: {
              transactionId: id
            }
          }
        }.to_xml(root: 'rapi-request', skip_types: true)
        response = post(MaxipagoApi.api_reports_endpoint, body: xml, headers: {'Content-Type' => 'text/plain'})
        Hash.from_xml(response.parsed_response)
      end
    end
  end
end