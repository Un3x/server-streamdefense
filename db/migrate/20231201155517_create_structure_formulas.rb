class CreateStructureFormulas < ActiveRecord::Migration[7.1]
  def change
    create_table :structure_formulas do |t|
      t.references :structures, null: false, foreign_key: true
      t.string :type
      t.string :formula

      t.timestamps
    end
  end
end
