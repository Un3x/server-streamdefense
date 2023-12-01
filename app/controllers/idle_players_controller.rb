class IdlePlayersController < ApplicationController
  before_action :set_idle_player, only: %i[ show edit update destroy ]

  # GET /idle_players or /idle_players.json
  def index
    @idle_players = IdlePlayer.all
  end

  # GET /idle_players/1 or /idle_players/1.json
  def show
  end

  # GET /idle_players/new
  def new
    @idle_player = IdlePlayer.new
  end

  # GET /idle_players/1/edit
  def edit
  end

  # POST /idle_players or /idle_players.json
  def create
    @idle_player = IdlePlayer.new(idle_player_params)

    respond_to do |format|
      if @idle_player.save
        format.html { redirect_to idle_player_url(@idle_player), notice: "Idle player was successfully created." }
        format.json { render :show, status: :created, location: @idle_player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @idle_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /idle_players/1 or /idle_players/1.json
  def update
    respond_to do |format|
      if @idle_player.update(idle_player_params)
        format.html { redirect_to idle_player_url(@idle_player), notice: "Idle player was successfully updated." }
        format.json { render :show, status: :ok, location: @idle_player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @idle_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /idle_players/1 or /idle_players/1.json
  def destroy
    @idle_player.destroy!

    respond_to do |format|
      format.html { redirect_to idle_players_url, notice: "Idle player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idle_player
      @idle_player = IdlePlayer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idle_player_params
      params.require(:idle_player).permit(:channel_id, :user_id)
    end
end
