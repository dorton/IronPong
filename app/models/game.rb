class Game < ApplicationRecord
  has_many :players, through: :game_outcomes
  has_many :game_outcomes
end
