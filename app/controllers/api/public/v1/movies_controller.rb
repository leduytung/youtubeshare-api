module Api::Public::V1
  class MoviesController < Api::Public::PublicV1Controller
    def index
      render json: {
        movies: Movie.select(Constants::PublicMoviesController::ResponseFieldsAllow).order('created_at desc').page(movies_params[:page])
      }, status: :ok
    end

    private
    def movies_params
      params.permit(:page)
    end
  end
end
