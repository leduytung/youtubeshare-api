class SignInService
  attr_reader :user

  def initialize(params)
    @sign_in_params = params
    @user = nil
    @success = false
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

  def success?
    @success
  end

  private
  def define_user
    @user = User.find_by(email: @sign_in_params[:email])
  end

  def sign_up
    service = RegistrationService.new(@sign_in_params)
    @result = service.process
  end

  def sign_in
    @success = user.valid_password?(@sign_in_params[:password])
    if @success
      {
        messages: "SignIn Successfully",
        is_success: true,
        user: @user
      }
    else
      @result = {
        messages: "SignIn Failed",
        is_success: false
      }
    end
  end
end
