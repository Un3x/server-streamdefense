class CreateIdlePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :idle_players do |t|
      t.references :channel, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
