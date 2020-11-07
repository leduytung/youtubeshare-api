module Api::Secure
  class SecureV1Controller < ApplicationController
    def list
      render json: {messages: "NOTHING HERE"}, status: :ok
    end
  end
end