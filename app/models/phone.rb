class Phone < ApplicationRecord
    validates_numericality_of :number, greater_than_or_equal_to:  1111111111, less_than_or_equal_to: 9999999999, message: 'must be between 111111111 & 999999999'
    validates_uniqueness_of :number

    def self.save_record(phone_number, city)
        Phone.new(:number => phone_number , :city => city) 
    end 
end
