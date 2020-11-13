module Api::Public
  class PublicV1Controller < PublicApplicationController
    include Api::ExceptionsHandler

    private
    def authenticate_user!
      binding.pry
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