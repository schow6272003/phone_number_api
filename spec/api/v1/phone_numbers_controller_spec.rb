require 'rails_helper'
require 'rspec/rails'
include ApiHelper 
describe Api::V1::PhoneNumbersController, type: :request do 
  before :each do 
    Phone.create(number: 1111111111)
    Phone.create(number: 2222222222)
    Phone.create(number: 3333333333)
   end

    context "Phone Numbers Controller" do 

      it "assigns phone number by user" do
        post "/api/v1/phone_numbers/assign", params: {phone_number: "555-555-5555" }
        phone_number = Phone.where(:number => "5555555555")
        expect(phone_number.size).to eq(1)
        expect(response).to have_http_status(201)
      end

      it "assigns phone number when requested number already exists" do
        post "/api/v1/phone_numbers/assign", params: {phone_number: "333-333-3333" }
        new_number = Phone.where.not(:number => [1111111111,2222222222,3333333333] )
        phone_number = Phone.all
        expect(phone_number.size).to eq(4)
        expect(new_number.size).to eq(1)
        expect(response).to have_http_status(201)
      end


      it "looks up a phone number" do
        get "/api/v1/phone_numbers/look_up", params: {phone_number: "1111111111" }
        parsed_json_body = JSON(response.body)
        phone_number = parsed_json_body["data"]
        expect(phone_number["number"]).to eq(1111111111)
        expect(response).to have_http_status(200)
      end

      it "delete a phone number" do
        post "/api/v1/phone_numbers/delete", params: {phone_number: "1111111111" }
        phone_numbers = Phone.all
        expect(phone_numbers.size).to eq(2)
        expect(response).to have_http_status(200)
      end

      it "renders error invalid phone number" do
        post "/api/v1/phone_numbers/assign", params: {phone_number: "111"}
        phone_number = Phone.all
        expect(phone_number.size).to eq(3)
        parsed_json_body = JSON(response.body)
        expect(parsed_json_body["message"]).to  eq({"number"=>["must be between 111-111-1111 & 999-999-9999"]})
        expect(response).to have_http_status(500)
      end

    end

end