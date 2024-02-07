# frozen_string_literal: true

class Structure < ApplicationRecord
  has_many :structure_requirements

  validates :name, presence: true
end
