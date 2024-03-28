# frozen_string_literal: true

class IdleGameConfiguration
  include Singleton

  def season
    @season ||= Season.find_by(active: true)
  end

  def resources
    @resources ||= load_resources
  end

  def structures
    @structures ||= load_structures
  end

  def structure_requirements_by_required_structure
    @structure_requirements_by_required_structure ||= load_structure_requirements_by_required_structure
  end

  def structure_requirements_for_required_structure(structure_id)
    structure_requirements_by_required_structure[structure_id] || []
  end

  def structure(key)
    structures[key].first
  end

  def resource(key)
    resources[key].first
  end

  def structure_formulas_for_category(structure_key, category)
    structure(structure_key).structure_formulas.select { |formula| formula.category == category }
  end

  private

  def load_resources
    Resource.where(season:).order(:id).goupd_by(&:key)
  end

  def load_structures
    Structure
      .where(season:)
      .includes(:structure_requirements, :structure_level_details, structure_formulas: :resource)
      .order(:id)
      .group_by(&:key)
  end

  def load_structure_requirements_by_required_structure
    StructureRequirement
      .joins(:structure)
      .where(structure: { season: })
      .group_by(&:required_structure_id)
  end
end
