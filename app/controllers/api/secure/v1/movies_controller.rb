module Api::Secure::V1
  class MoviesController < Api::Secure::SecureV1Controller
    def index
      render json: {
        movies: Movie.select(Constants::SecureMoviesController::ResponseFieldsAllow).order('created_at desc').page(movies_params[:page])
      }, status: :ok
    end

    def create
      Movie.create(movies_params.merge(user_id: @current_user.id))
      render status: :ok
    end

    private
    def movies_params
      params.permit(:page, :url, :title, :description)
    end
  end
end
