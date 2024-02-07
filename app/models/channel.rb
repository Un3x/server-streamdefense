# frozen_string_literal: true

class Channel < ApplicationRecord
  has_many :idle_games

  validates :twitch_id, presence: true
end
