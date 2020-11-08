# frozen_string_literal: true

class Api::Devise::V1::Users::SessionsController < Devise::SessionsController
  # before_action :sign_in_params, only: :create
  # before_action :define_user, only: :create

  def create
    # Sign Service
    sign_in_service = SignInService.new(sign_in_params)
    result = sign_in_service.process

    # Process response
    render json: result, status: sign_in_service.success ? :ok : :unauthorized
  end

  private
  def sign_in_params
    params.permit :email, :password
  end
end
