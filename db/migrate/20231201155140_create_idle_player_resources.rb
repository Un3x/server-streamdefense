class CreateIdlePlayerResources < ActiveRecord::Migration[7.1]
  def change
    create_table :idle_player_resources do |t|
      t.references :idle_players, null: false, foreign_key: true
      t.references :resources, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
