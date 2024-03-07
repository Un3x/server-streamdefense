# frozen_string_literal: true

class StructureLevelDetail < ApplicationRecord
  belongs_to :structure

  validates :level, presence: true
  validates :description, presence: true
  validates :structure, presence: true
end
