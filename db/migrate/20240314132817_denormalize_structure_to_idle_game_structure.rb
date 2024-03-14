class DenormalizeStructureToIdleGameStructure < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_game_structures, :key, :string
    add_column :idle_game_structures, :name, :string
    add_column :idle_game_structures, :icon_url, :string

    IdleGameStructure.find_each(&:recalculate)
  end
end
