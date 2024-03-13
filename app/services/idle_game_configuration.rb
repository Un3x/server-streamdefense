# frozen_string_literal: true

class IdleGameConfiguration
  include Singleton

  def resources
    @resources || load_resources
  end

  def structures
    @structures || load_structures
  end

  def structure(key)
    structures[key].first
  end

  def resource(key)
    resources[key].first
  end

  private

  def load_resources
    @resources = Resource.order(:id).goupd_by(&:key)
  end

  def load_structures
    @structures = Structure
                  .includes(:structure_requirements, :structure_formulas, :structure_level_details)
                  .order(:id)
                  .group_by(&:key)
  end
end
