# frozen_string_literal: true

class IdleGameConfiguration
  include Singleton

  def initialize
    @redis = Redis.new
  end

  def reload
    @redis.flushdb # Efface toutes les données du cache
  end

  def season
    Season.new(fetch_from_cache('season') { Season.find_by(active: true) })
  end

  def resources
    fetch_from_cache('resources') { load_resources }
  end

  def structures
    fetch_from_cache('structures') { load_structures }
  end

  def structure_formulas_for_category(structure_key, category)
    structure(structure_key).structure_formulas.select { |formula| formula.category == category }
  end

  def structure_formula_for_category_and_resource(structure_key, category, resource_key)
    structure(structure_key).structure_formulas.find { |formula| formula.category == category && formula.resource == resource_key }
  end

  def structure_requirements_by_required_structure
    @structure_requirements_by_required_structure ||= fetch_from_cache('structure_requirements') { load_structure_requirements_by_required_structure }
  end

  def structure_requirements_for_required_structure(structure_id)
    requirements = structure_requirements_by_required_structure[structure_id] || []
    requirements.map { |requirement| StructureRequirement.new(requirement) }
  end

  def structure(key)
    struc = structures[key]
    return Structure.new(struc.first) if struc

    nil
  end

  def resource(key)
    res = resources[key]

    return Resource.new(res.first) if res

    nil
  end

  private

  def fetch_from_cache(key)
    data = @redis.get(key)
    return JSON.parse(data) if data

    result = yield
    @redis.set(key, result.to_json)
    result.as_json
  end

  def load_resources
    Resource
      .where(season:)
      .order(:id)
      .group_by(&:key)
  end

  def load_structures
    Structure
      .where(season_id: season['id'])
      .includes(:structure_requirements, structure_formulas: :resource)
      .order(:id)
      .group_by(&:key)
  end

  def load_structure_requirements_by_required_structure
    StructureRequirement
      .joins(:structure)
      .where(structure: { season_id: season['id'] })
      .group_by(&:required_structure_id)
  end
end
