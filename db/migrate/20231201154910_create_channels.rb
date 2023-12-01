class CreateChannels < ActiveRecord::Migration[7.1]
  def change
    create_table :channels do |t|
      t.string :twitch_channel_id
      t.string :streamer_name

      t.timestamps
    end
  end
end
