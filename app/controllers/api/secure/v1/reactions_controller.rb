module Api::Secure::V1
  class ReactionsController < Api::Secure::SecureV1Controller
    def react
      ReactionService.react(movies_params.merge(user_id: @current_user.id))
      render status: :ok
    end

    def get_reactions
      render json: {
        reactions: ReactionService.get_reactions(movies_params.merge(user_id: @current_user))
      }, status: :ok
    end

    private
    def movies_params
      params.permit(
        :movie_id,
        :react_type,
        movie_ids: [])
    end
  end
end
