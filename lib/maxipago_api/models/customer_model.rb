require 'maxipago_api/requests/customer_request.rb'
module MaxipagoApi
  class CustomerModel
    attr_accessor :customer_id_ext, :first_name, 
      :last_name, :email,:birth_date, :document,
      :sex, :address1, :address2, :city, :state, :zipcode, :country, :phone, :email, :id, :response_error

    def initialize(options = {})
      self.customer_id_ext = options[:customer_id_ext]
      self.first_name = options[:first_name]
      self.last_name = options[:last_name]
      self.zipcode = options[:zipcode]
      self.email = options[:email]
      self.birth_date = options[:birth_date]
      self.document = options[:document]
      self.sex = options[:sex]
      self.address1 = options[:address1]
      self.address2 = options[:address2]
      self.city = options[:city]
      self.state = options[:state]
      self.zipcode = options[:zipcode]
      self.country = options[:country]
      self.phone = options[:phone]
      self.email = options[:email]
    end

    def save
      MaxipagoApi::CustomerRequest.create(self)
    end

    def self.find(id)
      MaxipagoApi::CustomerRequest.find(id)
    end

    def to_object
      {
        customerIdExt: self.customer_id_ext,
        firstName: self.first_name,
        lastName: self.last_name,
        zip: self.zipcode,
        email: self.email,
        dob: self.sex,
        ssn: self.document,
        sex: self.sex
    }
    end
  end
end