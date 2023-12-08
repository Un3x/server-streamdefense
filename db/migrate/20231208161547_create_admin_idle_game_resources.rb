# frozen_string_literal: true

class CreateAdminIdleGameResources < ActiveRecord::Migration[7.1]
  def change
    create_table :idle_game_resources do |t|
      t.references :idle_game, null: false, foreign_key: true
      t.references :resource, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
