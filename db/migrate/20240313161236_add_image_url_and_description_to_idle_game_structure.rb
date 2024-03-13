class AddImageUrlAndDescriptionToIdleGameStructure < ActiveRecord::Migration[7.1]
  def change
    add_column :idle_game_structures, :image_url, :string
    add_column :idle_game_structures, :description, :text

    IdleGameStructure.all.each(&:recalculate)
  end
end
