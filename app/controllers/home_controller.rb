class HomeController < ApplicationController
  def index
    @players = Player.sorted_by_winning_percentage

  end
end
