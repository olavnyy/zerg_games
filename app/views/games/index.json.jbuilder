json.array!(@games) do |game|
  json.extract! game, :name, :publisher, :website, :genre, :year, :description
  json.url game_url(game, format: :json)
end
