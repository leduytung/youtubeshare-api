require 'rails_helper'

RSpec.describe RegistrationService do
  $data = {email: Faker::Internet.email, password: Faker::Internet.password}
  describe "#process" do
    context "create user" do
      result = RegistrationService.new($data).process

      it "User registration message response" do
          expect(result[:messages]).to eq "Registration Successfully"
      end

      it "User registration success" do
        expect(result[:is_success]).to eq true
      end

      it "User registration user data response" do
        expect(result[:user].class.name).to eq 'User'
      end
    end

    context "user already exist" do
      result = RegistrationService.new($data).process

      it "User registration message" do
          expect(result[:messages][:email]).to eq ["has already been taken"]
      end

      it "User registration" do
        expect(result[:is_success]).to eq false
      end
    end
  end
end
