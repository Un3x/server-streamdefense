# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Rememberable
      t.datetime :remember_created_at

      t.string :twitch_id, null: true, default: nil
      t.string :nickname, null: true, default: nil
      t.string :role, null: false, default: 'USER'
    end

    add_index :users, :email, unique: true
  end
end
