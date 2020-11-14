class Reaction < ApplicationRecord
  enum react_type: { like: 1, dislike: 0 }
  belongs_to :user
  belongs_to :movie

  def liked?
    return react_type == 'like'
  end

  def disliked?
    return react_type == 'dislike'
  end

  private
end
