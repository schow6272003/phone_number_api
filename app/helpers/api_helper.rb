module ApiHelper
  
    def generate_phone_number
         rand(1111111111..9999999999) 
    end 
    
    def process_number(n)
       n.gsub(/-/, '').to_i 
    end
  end