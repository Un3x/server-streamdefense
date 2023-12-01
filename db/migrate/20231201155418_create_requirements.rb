class CreateRequirements < ActiveRecord::Migration[7.1]
  def change
    create_table :requirements do |t|
      t.references :structures, null: false, foreign_key: true
      t.integer :required_level

      t.timestamps
    end
  end
end
