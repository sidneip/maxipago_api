require "maxipago_api/version"
require 'maxipago_api/models/customer_model.rb'
require 'maxipago_api/models/credit_card_model.rb'
require 'maxipago_api/models/transaction_model.rb'
require 'maxipago_api/requests/customer_request.rb'

module MaxipagoApi
  class Error < StandardError; end
  class << self
    attr_accessor :api_register_endpoint, :api_transaction_endpoint, :store_id, :store_key
  end
  self.store_key      = ENV['MAXIPAGO_API_KEY']
  self.store_id       = ENV['MAXIPAGO_STORE_ID']
  self.api_register_endpoint   = 'https://testapi.maxipago.net/UniversalAPI/postAPI'
  self.api_transaction_endpoint = 'https://testapi.maxipago.net/UniversalAPI/postXML'

  def self.production?
    ENV['RACK_ENV']  == 'production' ||
    ENV['RAILS_ENV'] == 'production' ||
    ENV['PRODUCTION'] ||
    ENV['production']
  end
end
