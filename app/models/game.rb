class Game < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	has_many :game_plays, dependent: :destroy
	has_many :users, through: :game_plays
	has_many :scores, through: :game_plays

	accepts_nested_attributes_for :comments, allow_destroy: true

	validates_presence_of :name, :publisher, :genre, :year, :description

	has_attached_file :logo, :styles => { :small => "240x320" }
	has_attached_file :game_file, :path => ":rails_root/public/games/unity/:id/:basename.:extension"
	has_attached_file :screenshot

	validates_attachment_presence :game_file
	validates_attachment_size :game_file, :less_than => 50.megabytes
	validates_attachment_content_type :game_file, :content_type => ['application/octet-stream', 'application/vnd.unity']

	validates_attachment_presence :logo
	validates_attachment_size :logo, :less_than => 2.megabytes
	validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png']

	private
		def comment_message_blank(_attributes)
			binding.pry
			_attributes[:message].blank?
		end
end
