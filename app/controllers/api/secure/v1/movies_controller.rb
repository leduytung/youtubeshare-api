module Api::Secure::V1
  class MoviesController < Api::Secure::SecureV1Controller
    def get
      render json: {data: Movie.all}, status: :ok
    end
  end
end
