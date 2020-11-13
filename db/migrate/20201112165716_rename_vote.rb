class RenameVote < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :upvote, :like
    rename_column :movies, :downvote, :dislike
  end
end
