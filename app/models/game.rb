class Game < ActiveRecord::Base
	has_many :comments, :dependent => :destroy
	accepts_nested_attributes_for :comments, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
