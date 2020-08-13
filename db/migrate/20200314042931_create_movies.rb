class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.integer :user_id
      t.integer :artist_id
      t.integer :genre_id
      t.string :title
      t.string :duration
      t.integer :budget

      t.timestamps
    end
  end
end
