module Api::Public::V1
  class UsersController < Api::Public::PublicV1Controller
    def emails
      render json: {
        emails: User.where(id: users_params["user_ids"]).pluck(:id, :email).to_h
      }, status: :ok
    end

    private
    def users_params
      params.permit(
        user_ids: []
      )
    end
  end
end
