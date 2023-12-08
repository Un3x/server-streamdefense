# frozen_string_literal: true

class CreateAdminChannels < ActiveRecord::Migration[7.1]
  def change
    create_table :channels do |t|
      t.string :twitch_id

      t.timestamps
    end
  end
end
