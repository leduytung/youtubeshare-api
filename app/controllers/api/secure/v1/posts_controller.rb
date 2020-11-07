module Api::Secure::V1
  class PostsController < Api::Secure::SecureV1Controller
    def list
      render json: {messages: "NOTHING HERE"}, status: :ok
    end
  end
end