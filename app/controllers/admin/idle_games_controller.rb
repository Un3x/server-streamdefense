# frozen_string_literal: true

module Admin
  class IdleGamesController < AdminUsersController
    before_action :set_idle_game, only: %i[show edit update destroy]

    # GET /admin/idle_games or /admin/idle_games.json
    def index
      @idle_games = IdleGame.all
    end

    # GET /admin/idle_games/1 or /admin/idle_games/1.json
    def show; end

    # GET /admin/idle_games/new
    def new
      @idle_game = IdleGame.new
    end

    # GET /admin/idle_games/1/edit
    def edit; end

    # POST /admin/idle_games or /admin/idle_games.json
    def create
      @idle_game = IdleGame.new(idle_game_params)

      respond_to do |format|
        if @idle_game.save
          format.html { redirect_to admin_idle_game_url(@idle_game), notice: 'Idle game was successfully created.' }
          format.json { render :show, status: :created, location: @idle_game }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @idle_game.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/idle_games/1 or /admin/idle_games/1.json
    def update
      respond_to do |format|
        if @idle_game.update(idle_game_params)
          format.html { redirect_to admin_idle_game_url(@idle_game), notice: 'Idle game was successfully updated.' }
          format.json { render :show, status: :ok, location: @idle_game }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @idle_game.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/idle_games/1 or /admin/idle_games/1.json
    def destroy
      @idle_game.destroy!

      respond_to do |format|
        format.html { redirect_to admin_idle_games_url, notice: 'Idle game was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_idle_game
      @idle_game = IdleGame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idle_game_params
      params.require(:idle_game).permit(:channel_id, :user_id)
    end
  end
end
