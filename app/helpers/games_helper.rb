module GamesHelper
	def best_score(_game)#Define best score for each game of user
    _game.scores.order(:score).reverse_order.first.score.to_s
  end
end
