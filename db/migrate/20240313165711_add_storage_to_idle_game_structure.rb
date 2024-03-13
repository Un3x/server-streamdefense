class AddStorageToIdleGameStructure < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_game_structures, :storage, :jsonb, default: {}, null: false

    IdleGameStructure.all.each(&:recalculate)
  end
end
