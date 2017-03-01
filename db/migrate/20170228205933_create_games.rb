class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :winner
      t.string :loser
      t.string :winning_score
      t.string :losing_score
      t.string :spread
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
