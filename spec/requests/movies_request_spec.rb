require 'rails_helper'

RSpec.describe "Movies", type: :request do
  describe "GET" do
    before(:all) do
      $user = create(:user)
      $movie = create(:movie, user_id: $user.id)
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
