# frozen_string_literal: true

module Admin
  class IdleGamesController < AdminUsersController
    before_action :set_idle_game, only: %i[show destroy]

    # GET /admin/idle_games or /admin/idle_games.json
    def index
      @idle_games = IdleGame.all
    end

    # GET /admin/idle_games/1 or /admin/idle_games/1.json
    def show; end

    # DELETE /admin/idle_games/destroy_all
    def destroy_all
      IdleGame.destroy_all

      respond_to do |format|
        format.html { redirect_to admin_idle_games_url, notice: 'Idles games was successfully destroyed.' }
        format.json { head :no_content }
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
  end
end
