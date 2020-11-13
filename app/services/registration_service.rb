class RegistrationService
  attr_reader :user

  def initialize(user_params)
    @user_params = user_params
    @user = nil
  end

  def process
    create_user
    @result
  end

  def success
    @user.errors.blank?
  end

  private
  def create_user
    user = User.new @user_params
    @result = if user.save
      @user = user
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
