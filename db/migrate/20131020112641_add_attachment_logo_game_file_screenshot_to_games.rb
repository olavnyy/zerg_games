class AddAttachmentLogoGameFileScreenshotToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :logo
      t.attachment :game_file
      t.attachment :screenshot
    end
  end

  def self.down
    drop_attached_file :games, :logo
    drop_attached_file :games, :game_file
    drop_attached_file :games, :screenshot
  end
end
