class CreateGamePlays < ActiveRecord::Migration
  def change
    create_table :game_plays do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :count
      t.integer :score

      t.timestamps
    end
  end
end
