class AddOutcomeToGame < ActiveRecord::Migration[5.0]
  def change
    add_reference :games, :game_outcome, foreign_key: true
  end
end
