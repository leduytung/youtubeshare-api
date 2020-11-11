module Api::Secure
  class SecureV1Controller < ApplicationController
    include Api::ExceptionsHandler
    before_action :authenticate_user!

    private
    def authenticate_user!
      token = request.headers['Authorization']
      raise AuthenticationError, 'Token missing!' if token.blank?
      @auth_service = AuthenticationService.new(token)
      @auth_service.process
      unless @auth_service.valid?
        raise AuthenticationError, 'Token invalid!'
      end
      @current_user = @auth_service.current_user
    end
  end
end

class AuthenticationError < StandardError; end
