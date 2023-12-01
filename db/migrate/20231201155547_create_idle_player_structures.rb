class CreateIdlePlayerStructures < ActiveRecord::Migration[7.1]
  def change
    create_table :idle_player_structures do |t|
      t.references :structures, null: false, foreign_key: true
      t.references :idle_players, null: false, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
