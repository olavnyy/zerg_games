json.array!(@comments) do |comment|
  json.extract! comment, :message, :user_id, :game_id
  json.url comment_url(comment, format: :json)
end
