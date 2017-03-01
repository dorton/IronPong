json.extract! game, :id, :winner, :loser, :winning_score, :losing_score, :spread, :player_id, :created_at, :updated_at, :players
json.url game_url(game, format: :json)
