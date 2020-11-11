require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET" do
    before do
      $movie = create(:movie)
      get '/public/v1/movies'
    end

    it "Return success" do
      expect(response).to have_http_status(200)
    end

    it "JSON body response must have allowed fields" do
      hash_body = JSON.parse(response.body)
      movie = hash_body["movies"].first
      expect(movie.keys).to match_array(Constants::PublicMoviesController::ResponseFieldsAllow)
    end
  end
end
