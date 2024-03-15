# frozen_string_literal: true

class IdleGame < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  belongs_to :season

  has_many :idle_game_resources, dependent: :destroy
  has_many :idle_game_structures, dependent: :destroy

  validates :channel, presence: true
  validates :season, presence: true
  validates :user, presence: true
end
