module Api::Secure
  class SecureV1Controller < ApplicationController
    before_action :authenticate_user!

    private
    def authenticate_user!
      @auth_service = AuthenticationService.new headers['Authorization']
      unless @auth_service.valid?
        raise AuthenticationError, 'Token invalid!'
      end
      @driver_id = @auth_service.current_driver_id
    end

  end
end