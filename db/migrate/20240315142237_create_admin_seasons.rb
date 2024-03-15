class CreateAdminSeasons < ActiveRecord::Migration[7.1]
  def change
    create_table :seasons do |t|
      t.string :name
      t.integer :speed, default: 1
      t.boolean :active, default: false

      t.timestamps
    end

    add_reference :idle_games, :season, foreign_key: true
    add_reference :structures, :season, foreign_key: true
    add_reference :resources, :season, foreign_key: true
  end
end
