require 'maxipago_api/requests/transaction_request.rb'
module MaxipagoApi
  class TransactionModel
    attr_accessor :customer_id, :token, :ip_address, :reference_number, :charge_total
    def initialize(options = {})
      self.customer_id = options[:customer_id]
      self.token = options[:token]
      self.ip_address = options[:ip_address]
      self.reference_number = options[:reference_number]
      self.charge_total = options[:charge_total]
    end

    def save
      MaxipagoApi::TransactionRequest.create(self)
    end

    def find
    end

    def to_object
      {
        sale: {
          processorID: 1,
          referenceNum: self.reference_number,
          ipAddress: self.ip_address,
          transactionDetail: {
            payType: {
              onFile: {
                customerId: self.customer_id,
                token: self.token,
              },
            }
          },
          payment: {
            currencyCode: 'BRL',
            chargeTotal: self.charge_total
          }
        }
      }
    end
  end
end