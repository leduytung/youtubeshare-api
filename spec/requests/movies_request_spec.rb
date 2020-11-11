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

    it "JSON body response must same with record created" do
      hash_body = JSON.parse(response.body)
      movie = hash_body["movies"].first
      expect(movie).to eq(JSON.parse($movie.to_json))
    end
  end
end
