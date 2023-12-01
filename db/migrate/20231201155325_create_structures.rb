class CreateStructures < ActiveRecord::Migration[7.1]
  def change
    create_table :structures do |t|
      t.string :name
      t.string :description
      t.string :img_url

      t.timestamps
    end
  end
end
