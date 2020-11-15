require 'rails_helper'

RSpec.describe SignOutService do
  before(:each) do
    @user = create(:user)
    @old_token = @user.authentication_token
    puts 'old ' + @old_token
  end

  describe "#process" do
    context "action sign out" do
      it "should renew authentication_token" do
        SignOutService.new(@old_token).process
        user = User.find(@user.id)
        expect(user.authentication_token).not_to eq(@old_token)
      end
    end
  end
end
