class AddOutcomeToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_reference :players, :game_outcome, foreign_key: true
  end
end
