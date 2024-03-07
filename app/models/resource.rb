# frozen_string_literal: true

class Resource < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :name, presence: true
  validates :key, presence: true, uniqueness: { case_sensitive: false }
  has_one_attached :icon

  def icon_url
    return Rails.application.routes.url_helpers.rails_blob_path(icon, only_path: true) if icon.attached?

    nil
  end
end
