class GamesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  @@game_play = nil
  @@user_play = nil

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @comments = Comment.where(:game_id => @game.id)
    @top_scores = @game.scores.order(:score).reverse_order.limit(10)
    @game_play = params[:id]
    @user_play = current_user.id
  end

  # GET /games/new
  def new
    @game = Game.new
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
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  def set_player_data
    @gameplay = GamePlay.find_or_create_by_game_id_and_user_id(params[:game_id], params[:user_id])
    @score = Score.new(:score => params[:score])
    @gameplay.count += 1
    @gameplay.scores << @score
    @gameplay.save
    render :nothing => true
  end

  def get_player_data
    render :json => {:user => @@user_play, :game => @@game_play}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :publisher, :website, :genre, :year, :description, :game_file, :logo, :screenshot)
    end
end
