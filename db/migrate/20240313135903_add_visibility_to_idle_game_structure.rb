class AddVisibilityToIdleGameStructure < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_game_structures, :visible, :boolean, null: false, default: false

    IdleGameStructure.all.each(&:recalculate)
  end
end
