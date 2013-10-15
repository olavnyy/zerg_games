class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :publisher
      t.string :website
      t.string :genre
      t.date :year
      t.text :description

      t.timestamps
    end
  end
end
