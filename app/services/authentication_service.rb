class AuthenticationService
  def initialize(token)
    @token = token
    @user = nil
  end

  def process
    authenticate
  end

  def valid?
    @user.present?
  end

  def current_user
    @user
  end

  private

  def authenticate
    @user = User.find_by(authentication_token: @token)
  end
end
