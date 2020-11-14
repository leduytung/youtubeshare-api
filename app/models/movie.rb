class Movie < ApplicationRecord
  belongs_to :user
  has_one :reaction

  def like!
    self.update(like: like + 1, dislike: dislike - 1)
  end

  def dislike!
    self.update(like: like - 1, dislike: dislike + 1)
  end
end
