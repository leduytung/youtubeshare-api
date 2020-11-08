class SignInService
  attr_reader :user

  def initialize(params)
    @sign_in_params = params
    @user = nil
  end

  # If user does not exist, use sign up
  def process
    define_user
    if @user
      sign_in
    else
      sign_up
    end
  end

  def success
    @user.present?
  end

  private

  def define_user
    @user = User.find_by(email: @sign_in_params[:email])
  end

  def sign_up
    regis_service = RegistrationService.new(@sign_in_params)
    regis_service.create_user
  end


  def sign_in
    if user.valid_password?(@sign_in_params[:password])
      user.renew_authentication_token!
      @user = user
    else
      {message: 'Invalid credential'}
    end
  end
end
