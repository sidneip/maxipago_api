module MaxipagoApi
  class TransactionModel
    attr_accessor :customer_id_ext, :reference_number, :charge_total
    def initialize(options = {})
      self.customer_id_ext = options[:customer_id_ext]
      self.reference_number = options[:reference_number]
      self.charge_total = options[:charge_total]
    end

    def save
      MaxipagoApi::TransactionRequest.create(self)
    end

    def find
    end
  end
end