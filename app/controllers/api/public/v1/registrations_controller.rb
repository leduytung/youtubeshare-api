# frozen_string_literal: true
class Api::Devise::V1::RegistrationsController < Devise::RegistrationsController
  before_action :verify_params, only: :create

  # POST /resource
  def create
    # Registration service
    regis_service = RegistrationService.new(user_params)
    result = regis_service.process

    # Process response
    render json: result, status: regis_service.success ? :ok : :unprocessable_entity
  end

  private
  def user_params
    params.permit(:email, :password)
  end

  def verify_params
    return if params[:email].present? && params[:password].present?
    render json: { messages: "Missing Params" }, status: :bad_request
  end
end
