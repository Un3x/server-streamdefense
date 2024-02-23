# frozen_string_literal: true

class IdleGameStructureController < ApplicationController
  before_action :validate_params
  before_action :identify_idle_game_structure

  def level_up
    last_sync = @idle_game_structure.idle_game.last_sync

    IdleSynchronizor.new(@idle_game_structure.idle_game).perform
    IdleGameStructureLevelUp.new(@idle_game_structure).prepare_level_up

    render json: {
      status: 200,
      data: IdleGameFormatter.new(@idle_game_structure.idle_game, last_sync).format_idle_game
    }
  end

  def cancel
    last_sync = @idle_game_structure.idle_game.last_sync

    IdleSynchronizor.new(@idle_game_structure.idle_game).perform
    IdleGameStructureLevelUp.new(@idle_game_structure).cancel

    render json: {
      status: 200,
      data: IdleGameFormatter.new(@idle_game_structure.idle_game, last_sync).format_idle_game
    }
  end

  private

  def validate_params
    render json: { status: 422, message: 'Missing parameters' }, status: :unprocessable_entity if params[:structure_id].nil?
  end

  def identify_idle_game_structure
    @idle_game_structure = IdleGameStructure.find(params[:structure_id])
  end
end
