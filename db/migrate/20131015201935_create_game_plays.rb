class CreateGamePlays < ActiveRecord::Migration
  def change
    create_table :game_plays do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :count, :default => 0

      t.timestamps
    end

    def down
    	remove_column :game_plays, :count
    end
  end
end
