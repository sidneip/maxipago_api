require 'maxipago_api/requests/credit_card_request.rb'
module MaxipagoApi
  class CreditCardModel
    attr_accessor :customer_id, :credit_card_number, :expiration_month, :expiration_year,
      :billing_name, :billing_address1, :billing_address2, :billing_city,
      :billing_state, :billing_zipcode, :billing_country, :billing_phone,
      :billing_email
    
      def initialize(options = {})
        self.customer_id = options[:customer_id]
        self.credit_card_number = options[:credit_card_number]
        self.expiration_month = options[:expiration_month]
        self.expiration_year = options[:expiration_year]
        self.billing_name = options[:billing_name]
        self.billing_address1 = options[:billing_address1]
        self.billing_address2 = options[:billing_address2]
        self.billing_city = options[:billing_city]
        self.billing_state = options[:billing_state]
        self.billing_zipcode = options[:billing_zipcode]
        self.billing_country = options[:billing_country]
        self.billing_phone = options[:billing_phone]
        self.billing_email = options[:billing_email]
      end

    def save
      MaxipagoApi::CreditCardRequest.save(self)
    end

    def to_object
      {
        customerId: self.customer_id,
        creditCardNumber: self.credit_card_number,
        expirationMonth: self.expiration_month,
        expirationYear: self.expiration_year,
        billingName: self.billing_name,
        billingAddress1: self.billing_address1,
        billingAddress2: self.billing_address2,
        billingCity: self.billing_city,
        billingState: self.billing_state,
        billingZip: self.billing_zipcode,
        billingCountry: self.billing_country,
        billingPhone: self.billing_phone,
        billingEmail: self.billing_email,
      }.select{|k,v| v.present?}
    end
  end
end