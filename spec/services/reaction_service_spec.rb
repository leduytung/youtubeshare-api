require 'rails_helper'

RSpec.describe ReactionService do
  before(:each) do
    @user = create(:user)
    @movie = create(:movie, user_id: @user.id)
    @react_type = 1
    @params = {user_id: @user.id, movie_id: @movie.id, react_type: @react_type}.stringify_keys!
    @new_react_type = 0
    @change_react_params = {user_id: @user.id, movie_id: @movie.id, react_type: @new_react_type}.stringify_keys
  end
  describe "#react" do
    context "User make new reaction to a movie" do
      before(:each) do
        ReactionService.react(@params)
      end

      it "should create record same with params" do
        $result = Reaction.find_by(@params)
        expect($result).not_to eq(nil)
      end

      it "movie reaction count should update" do
        ReactionService.react(@change_react_params)
        movie = Movie.find(@movie.id)
        expect(movie.dislike).to eq @movie.dislike + 1
      end
    end
  end
end
