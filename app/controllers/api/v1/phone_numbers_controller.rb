module Api
    module V1
        class PhoneNumbersController < Api::BaseController
          include ApiHelper
          def assign
            # begin
              if params[:city].blank?
                render json: { "status" => "error", "message" => "Bad Request" }, status: 400
              else 
                get_phone_number
                render json: {"status" => "Successfully Created!"}, status: 201
              end 
            # rescue StandardError, AnotherError => e 
            #   p "Rescued: #{e.inspect}"
            #   render json: { "status" => "error", "message" => "Internal Server Error" }, status: 500 
            # end 
          end

          def all_phones_numbers
            render json: {"phone_numbers" => Phone.all}, status: 200
          end 

          private 
            def get_phone_number
              new_phone_number = params[:phone_number] || generate_phone_number
              p new_phone_number
              result = Phone.where(:number => new_phone_number.to_i) 
              while !result.blank?
                new_phone_number = generate_phone_number
                result = Phone.where(:number => new_phone_number) 
              end
              Phone.create(:number => new_phone_number, :city => params[:city])
            end 
      end 
    end
  end