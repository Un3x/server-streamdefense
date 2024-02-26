# frozen_string_literal: true

class Resource < ApplicationRecord
  validates :name, presence: true
  validates :key, presence: true, uniqueness: { case_sensitive: false }
end
