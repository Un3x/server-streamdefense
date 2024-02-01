# frozen_string_literal: true

class IdleGame < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  has_many :idle_game_resources
  has_many :idle_game_structures
end
