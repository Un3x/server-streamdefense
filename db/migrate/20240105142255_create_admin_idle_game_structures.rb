# frozen_string_literal: true

class CreateAdminIdleGameStructures < ActiveRecord::Migration[7.1]
  def change
    create_table :idle_game_structures do |t|
      t.references :structure, null: false, foreign_key: true
      t.references :idle_game, null: false, foreign_key: true
      t.integer :level

      t.timestamps
    end
  end
end
