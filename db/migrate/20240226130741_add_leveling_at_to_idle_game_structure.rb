class AddLevelingAtToIdleGameStructure < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_game_structures, :leveling_at, :timestamp, default: nil
  end
end
