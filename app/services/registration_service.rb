class RegistrationService
  attr_reader :user

  def initialize(user_params)
    @user_params = user_params
    @user = nil
  end

  def create_user
    @user = User.new @user_params
    if @user.save
      {
        messages: "Registration Successfully",
        is_success: true,
        user: @user
      }
    else
      {
        messages: @user.errors.messages, 
        is_success: false 
      }
    end
  end

  def success
    @user.errors.blank?
  end
end
