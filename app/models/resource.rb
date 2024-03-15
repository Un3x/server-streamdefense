# frozen_string_literal: true

class Resource < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :season

  validates :name, presence: true
  validates :season, presence: true
  validates :key, presence: true

  has_one_attached :icon

  def icon_url
    return Rails.application.routes.url_helpers.rails_blob_path(icon, only_path: true) if icon.attached?

    nil
  end
end
