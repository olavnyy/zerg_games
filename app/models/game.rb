class Game < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	has_many :game_plays, dependent: :destroy
	has_many :users, through: :game_plays
	has_many :scores, through: :game_plays
	accepts_nested_attributes_for :comments, :reject_if => lambda { |a| a[:message].blank? }, :allow_destroy => true
end
