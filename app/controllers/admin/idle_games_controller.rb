# frozen_string_literal: true

module Admin
  class IdleGamesController < AdminUsersController
    before_action :set_idle_game, only: %i[show]

    # GET /admin/idle_games or /admin/idle_games.json
    def index
      @idle_games = IdleGame.all
    end

    # GET /admin/idle_games/1 or /admin/idle_games/1.json
    def show; end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_idle_game
      @idle_game = IdleGame.find(params[:id])
    end
  end
end
