module Api::Public::V1
  class PostsController < Api::Public::PublicV1Controller
    def list
      render json: {messages: "NOTHING HERE"}, status: :ok
    end
  end
end