# frozen_string_literal: true

class Structure < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many :structure_level_details
  has_many :structure_requirements
  has_many :structure_formulas
  has_one_attached :icon

  validates :name, presence: true
  validates :key, presence: true, uniqueness: { case_sensitive: false }

  def structure_level_detail(level)
    structure_level_details.where('level <= ?', level).order(level: :desc).first
  end

  def icon_url
    return Rails.application.routes.url_helpers.rails_blob_path(icon, only_path: true) if icon.attached?

    nil
  end
end
