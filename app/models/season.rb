# frozen_string_literal: true

class Season < ApplicationRecord
  has_many :idle_games
  has_many :resources
  has_many :structures

  validates :name, presence: true
  validates :speed, presence: true
  validates :active, inclusion: [true, false]
end
