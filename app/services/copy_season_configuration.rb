# frozen_string_literal: true

class CopySeasonConfiguration
  attr_reader :season, :old_season

  def initialize(season, old_season)
    @season = season
    @old_season = old_season
  end

  def perform
    copy_resources
    copy_structures
  end

  private

  def copy_resources
    Resource.where(season: old_season).each do |resource|
      new_resource = resource.dup
      new_resource.season = @season
      new_resource.save!
    end
  end

  def copy_structures
    Structure.where(season: old_season).each do |structure|
      new_structure = structure.dup
      new_structure.season = @season
      new_structure.save!

      copy_structure_requirements(new_structure, structure)
      copy_structure_formulas(new_structure, structure)
    end
  end

  def copy_structure_requirements(new_structure, structure)
    StructureRequirement.where(structure:).each do |structure_requirement|
      new_structure_requirement = structure_requirement.dup
      new_structure_requirement.structure = new_structure
      new_structure_requirement.save!
    end
  end

  def copy_structure_formulas(new_structure, structure)
    StructureFormula.where(structure:).each do |structure_formula|
      new_structure_formula = structure_formula.dup
      new_structure_formula.structure = new_structure
      new_structure_formula.save!
    end
  end
end
