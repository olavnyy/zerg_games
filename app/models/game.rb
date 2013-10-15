class Game < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	has_many :game_plays, dependent: :destroy
	accepts_nested_attributes_for :comments, :reject_if => lambda { |a| a[:message].blank? }, :allow_destroy => true
end
