module Api
    module V1
        class PhoneNumbersController < Api::BaseController
          include ApiHelper

          def assign
            begin
              if params[:city].blank?
                render json: { "status" => "error", "message" => "Bad Request" }, status: 400
              else 
                assign_phone_number
              end 
            rescue StandardError => e 
              p "Rescued: #{e.inspect}"
              render json: { "status" => "error", "message" => e.message  }, status: 500 
            end 
          end

          def all_phones_numbers
            render json: {"phone_numbers" => Phone.all}, status: 200
          end 

          private 
            def assign_phone_number              
              if !params[:phone_number].blank? 
                record = Phone.where(:number => params[:phone_number])  
                if !record.blank?
                  render json: {"status" =>"error",  "message" => "Phone number has already been taken!"}, status: 400
                  return false
                else 
                  save_result = Phone.save_record(params[:phone_number].to_i, params[:city])
                end 
              else
                save_result = Phone.save_record(new_phone_number, params[:city])
              end 
     
              if save_result.save
                render json: {"status" => "success", "message" => "Successfully Created!"}, status: 201
              else
                p "hello"
                render json: {"status" => "error", "message" => save_result.errors}, status: :unprocessable_entit
              end 
            end 

            def new_phone_number
              phone_number = generate_phone_number
              record = Phone.where(:number =>  phone_number)   
              while !record.blank?
                phone_number = generate_phone_number
                record = Phone.where(:number => generate_phone_number) 
              end
              return phone_number
            end 

      end 
    end
  end