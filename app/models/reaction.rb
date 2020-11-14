class Reaction < ApplicationRecord
  enum react_type: { like: 1, dislike: 0 }
  belongs_to :user
  belongs_to :movie

  after_create :update_movie_reaction

  def liked?
    return react_type == 'like'
  end

  def disliked?
    return react_type == 'dislike'
  end

  def change_reaction(type)
    return if type == Reaction.react_types[react_type]
    liked? ? movie.dislike! : movie.like!
    update(react_type: type)
  end

  private

  def update_movie_reaction
    liked? ? movie.new_like! : movie.new_dislike!
  end
end
