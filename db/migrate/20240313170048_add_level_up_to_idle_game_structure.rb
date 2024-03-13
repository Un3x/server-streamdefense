class AddLevelUpToIdleGameStructure < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_game_structures, :level_up, :jsonb, default: {}, null: false

    IdleGameStructure.all.each(&:recalculate)
  end
end
