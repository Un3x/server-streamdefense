# frozen_string_literal: true

class CreateAdminStructures < ActiveRecord::Migration[7.1]
  def change
    create_table :structures do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
