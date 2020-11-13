# frozen_string_literal: true

class Api::Public::V1::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create

  def create
    # Sign Service
    sign_in_service = SignInService.new(sign_in_params)
    result = sign_in_service.process

    # Process response
    render json: result, status: sign_in_service.success? ? :ok : :unauthorized
  end

  def destroy
    sign_out_service = SignOutService.new(sign_out_params)
    result = sign_out_service.process
    render status: :ok
  end

  private

  def respond_to_on_destroy
  end

  def sign_in_params
    params.permit :email, :password
  end

  def sign_out_params
    request.headers['Authorization']
  end
end
