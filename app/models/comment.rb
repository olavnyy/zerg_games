class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :game

	validates :message, presence: true, allow_blank: false
end
