class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    @played_games = Game.where('winner is NOT NULL')
    @queued_games = Game.where('winner is NULL')
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @player1 = @game.players.map{|a| a.name}.first
    @player2 = @game.players.map{|a| a.name}.last

  end

  # GET /games/new
  def new
    @game = Game.new
    @players = Player.all
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        @game.update_attributes(spread: @game.winning_score.to_i - @game.losing_score.to_i)
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        @game.update_attributes(loser: @game.players.where("players.name != ?", @game.winner).first.name) if @game.winner.present?
        @game.update_attributes(spread: @game.winning_score.to_i - @game.losing_score.to_i)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:winner, :loser, :winning_score, :losing_score, :spread, player_ids: [])
    end
end
