# frozen_string_literal: true

class AddLevelingJobIdToIdleGameStructure < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_game_structures, :leveling_job_id, :string, default: nil
  end
end
