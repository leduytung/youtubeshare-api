class AddTableMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.references :user, index: true
      t.text :description
      t.string :url, null: false
      t.integer :upvote, null: false, default: 0
      t.integer :downvote, null: false, default: 0
      t.timestamps null: false
    end
  end
end
