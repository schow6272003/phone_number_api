require 'rails_helper'
require 'rspec/rails'
include ApiHelper 
describe Api::V1::PhoneNumbersController, type: :request do 

    context "Assign Action" do 
     it "assigns phone number automatically" do
        post "/api/v1/phone_numbers/assign", params: {city: "Alhambra"}
        phone_number = Phone.all
        expect(phone_number.size).to eq(1)
        expect(response).to have_http_status(201)
     end

     it "assigns phone number by user" do
        post "/api/v1/phone_numbers/assign", params: {city: "Alhambra", phone_number: "1111111111" }
        phone_number = Phone.where(:number => "1111111111")
        expect(phone_number.size).to eq(1)
        expect(response).to have_http_status(201)
      end

      it "renders bad request with no city" do
        post "/api/v1/phone_numbers/assign", params: { }
        phone_number = Phone.all
        expect(phone_number.size).to eq(0)
        parsed_json_body = JSON(response.body)
        expect(parsed_json_body["message"]).to  eq('Bad Request')
        expect(response).to have_http_status(400)
      end

      it "renders error invalid phone number" do
        post "/api/v1/phone_numbers/assign", params: {city: "Alhambra", phone_number: "11111"}
        phone_number = Phone.all
        expect(phone_number.size).to eq(0)
        parsed_json_body = JSON(response.body)
        expect(parsed_json_body["message"]).to  eq({"number"=>["must be between 111111111 & 999999999"]})
        expect(response).to have_http_status(500)
      end

    end

end