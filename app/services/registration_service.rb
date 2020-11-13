class RegistrationService
  attr_reader :user

  def initialize(user_params)
    @user_params = user_params
    @user = nil
    @success = false
  end

  def process
    create_user
  end

  def success?
    @success
  end

  private
  def create_user
    user = User.new @user_params
    if user.save
      @success = true
      {
        messages: "Registration Successfully",
        is_success: true,
        user: @user
      }
    else
      {
        messages: user.errors.messages, 
        is_success: false
      }
    end
  end
end
