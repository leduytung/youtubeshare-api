module Api::Secure::V1
  class MoviesController < Api::Secure::SecureV1Controller
    def index
      render json: {
        movies: Movie.select(Constants::SecureMoviesController::ResponseFieldsAllow).order('created_at desc').page(movies_params[:page])
      }, status: :ok
    end

    private
    def movies_params
      params.permit(:page)
    end
  end
end
