require 'rails_helper'

RSpec.describe SignInService do
  $data = {email: Faker::Internet.email, password: Faker::Internet.password}

  describe "#process" do
    context "action sign in with no account exist" do
      result = SignInService.new($data).process

      it "should have successfully registration message" do
          expect(result[:messages]).to eq "Registration Successfully"
      end

      it "should have is_success true" do
        expect(result[:is_success]).to eq true
      end

      it "should have user data return" do
        expect(result[:user].class.name).to eq 'User'
      end

      it "user should have authentication_token" do
        $authentication_token = result[:user][:authentication_token]
        expect($authentication_token).not_to be_nil
      end
    end

    context "action sign in with exist account" do
      result = SignInService.new($data).process

      it "should have successfully sign in message" do
        expect(result[:messages]).to eq "SignIn Successfully"
      end

      it "should have is_success true" do
        expect(result[:is_success]).to eq true
      end

      it "should have user data return" do
        expect(result[:user].class.name).to eq 'User'
      end

      it "user should have authentication_token" do
        expect(result[:user][:authentication_token]).not_to be_nil
      end
    end

    context "action sign in with wrong password" do
      result = SignInService.new(email: $data[:email], password: Faker::Internet.password).process

      it "should have failed sign in message" do
        expect(result[:messages]).to eq "SignIn Failed"
      end

      it "should have is_success false" do
        expect(result[:is_success]).to eq false
      end

      it "should not have user data" do
        expect(result[:user]).to be_nil
      end
    end
  end
end
