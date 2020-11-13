module Api::Secure::V1
  class UsersController < Api::Secure::SecureV1Controller

    def verify_token
      render json: { user: @current_user }, status: @current_user.present? ? :ok : :unauthorized
    end

    private
  end
end
