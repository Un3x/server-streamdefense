# frozen_string_literal: true

class Structure < ApplicationRecord
  has_many :structure_requirements
  has_many :structure_formulas

  validates :name, presence: true
end
