class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  has_many :games, through: :game_outcomes
  has_many :game_outcomes, dependent: :destroy


  def win_count
    Game.where(winner: self.name).count
  end

  def loss_count
    Game.where(loser: self.name).count
  end

  def total_games
    GameOutcome.joins(:player).where("players.name = ?", self.name).count
  end

  def winning_percentage
      ((self.win_count.to_f / (self.total_games.to_f.nonzero? || 1)) * 100).to_i

  end

  def self.sorted_by_winning_percentage
    Player.all.sort_by(&:winning_percentage).reverse
  end

end
