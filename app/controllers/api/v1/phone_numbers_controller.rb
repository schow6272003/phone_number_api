module Api
    module V1
        class PhoneNumbersController < Api::BaseController
          include ApiHelper

          def look_up
            phone_number = process_number(params[:phone_number])
            result = Phone.where(:number => phone_number)
            if !result.blank? 
              render json: {"status" => "success", "message" => "Successful Request!", "data" => result.first}, status: 200
            else
              render json:  {"status" => "error",  "message" =>  'Bad Request'}, status: 400
            end

          end
          
          def assign
            begin
              if params[:phone_number].blank?
                render json:  {"status" => "error",  "message" =>  'Bad Request'}, status: 400
              else 
                assign_phone_number
              end 
            rescue StandardError => e 
              p "Rescued: #{e.inspect}"
              render json: { "status" => "error", "message" => e.message  }, status: 500 
            end 
          end

          def delete 
            phone_number = process_number(params[:phone_number]) 
            result = Phone.where(:number => phone_number )
            if !result.blank? 
              result.destroy_all
              render json: {"status" => "success", "message" => "Successful Request!" }, status: 200
            else
              render json:  {"status" => "error",  "message" =>  'Bad Request'}, status: 400
            end
          end
               
          def all_phones_numbers
            render json: {"phone_numbers" => Phone.all}, status: 200
          end 

          private 
            def assign_phone_number   
              phone_number = process_number(params[:phone_number]) 
              record = Phone.where(:number => phone_number) 
              number_to_be_allotted  = !record.blank? ? new_phone_number : phone_number
              success_message =  !record.blank? ? phone_number.to_s + " already Exists. " +  number_to_be_allotted.to_s + " is allotted instead!" : "Number is successfully allotted!"
              save_result = Phone.save_record(number_to_be_allotted)
             
             if save_result.save
                render json: {"status" => "success", "message" => success_message }, status: 201
              else
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