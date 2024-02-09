# frozen_string_literal: true

class CreateStructureFormula < ActiveRecord::Migration[7.1]
  def change
    create_table :structure_formulas do |t|
      t.references :structure, null: false, foreign_key: true
      t.references :resource, default: nil, foreign_key: true
      t.string  'category', null: false
      t.string  'formula', null: false
      t.jsonb   'arguments', null: false, default: {}

      t.timestamps
    end
  end
end
