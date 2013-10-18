class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :game_play_id
      t.integer :score, :default => 0

      t.timestamps
    end
  end

  def down
  	drop_table :scores
  end
end
