# frozen_string_literal: true

class StructureLevelDetail < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :structure
  has_one_attached :image

  validates :level, presence: true
  validates :description, presence: true
  validates :structure, presence: true

  def image_url
    return Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) if image.attached?

    nil
  end
end
