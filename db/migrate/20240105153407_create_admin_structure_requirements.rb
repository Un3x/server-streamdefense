# frozen_string_literal: true

class CreateAdminStructureRequirements < ActiveRecord::Migration[7.1]
  def change
    create_table :structure_requirements do |t|
      t.references :structure, null: false, foreign_key: true
      t.references :required_structure, null: false, foreign_key: { to_table: :structures }
      t.integer :required_level

      t.timestamps
    end
  end
end
