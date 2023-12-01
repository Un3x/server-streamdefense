json.extract! channel, :id, :twitch_channel_id, :streamer_name, :created_at, :updated_at
json.url channel_url(channel, format: :json)
