class SignOutService
  attr_reader :user

  def initialize(params)
    @token = params
  end

  # If user does not exist, use sign up
  def process
    sign_out
  end

  private

  def sign_out
    user = User.find_by(authentication_token: @token)
    user.renew_authentication_token! if user
  end
end
