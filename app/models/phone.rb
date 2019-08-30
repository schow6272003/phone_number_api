class Phone < ApplicationRecord
    validates_numericality_of :number, greater_than_or_equal_to:  111111111111, less_than_or_equal_to: 999999999999, message: 'must be between 111111111 & 999999999'
    validates_uniqueness_of :number
end
