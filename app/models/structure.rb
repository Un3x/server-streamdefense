# frozen_string_literal: true

class Structure < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :season

  has_many :structure_formulas
  has_many :structure_requirements
  has_one_attached :icon

  validates :name, presence: true
  validates :season, presence: true
  validates :key, presence: true

  def icon_url
    return Rails.application.routes.url_helpers.rails_blob_path(icon, only_path: true) if icon.attached?

    nil
  end
end
