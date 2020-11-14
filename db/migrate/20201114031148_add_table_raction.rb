class AddTableRaction < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.references :movie, index: true, null: false
      t.references :user, index: true, null: false
      t.integer    :react_type
      t.timestamps null: false
    end
    add_index :reactions, [:user_id, :movie_id]
  end
end
