# frozen_string_literal: true

class ImportService
  require 'csv'
  require 'json'

  def import(file, model, season = nil)
    season ||= Season.find_by(active: true)

    opened_file = File.open(file.path)
    options = { headers: true, header_converters: :symbol, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      send "import_#{model}", row, season
    end
  end

  private

  def import_resource(row, season)
    resource = Resource.find_or_create_by(
      key: row[:key],
      season:
    )

    resource.update!(name: row[:name])

    resource.save!

    IdleGame.all.each do |idle_game|
      IdleGameResource.find_or_create_by(resource:, idle_game:) do |resource_game|
        resource_game.quantity = 0
      end
    end
  end

  def import_structure(row, season)
    structure = Structure.find_or_create_by(
      key: row[:key],
      season:
    )

    structure.update!(name: row[:name], description: row[:description], type: row[:type])

    IdleGame.all.each do |idle_game|
      IdleGameStructure.find_or_create_by(structure:, idle_game:) do |resource_game|
        resource_game.level = 0
      end
    end
  end

  def import_structure_level_detail(row, season)
    structure_level_detail = StructureLevelDetail.find_or_initialize_by(
      structure: Structure.find_by(key: row[:structure], season:),
      level: row[:level]
    )

    structure_level_detail.description = row[:description]

    structure_level_detail.save!
  end

  def import_structure_requirement(row, season)
    structure_requirement = StructureRequirement.find_or_create_by(
      structure: Structure.find_by(key: row[:structure], season:),
      required_structure: Structure.find_by(key: row[:required_structure], season:),
      restriction: row[:restriction] || 'above'
    )

    structure_requirement.update!(required_level: row[:level])

    structure_requirement.save!
  end

  def import_structure_formula(row, season)
    structure_formula = StructureFormula.find_or_initialize_by(
      structure: Structure.find_by(key: row[:structure], season:),
      resource: Resource.find_by(key: row[:resource], season:) || nil,
      category: row[:category],
      formula: row[:formula]
    )

    add_formula_arguments(structure_formula, row)

    structure_formula.save!
  end

  def add_formula_arguments(structure_formula, row)
    structure_formula.arguments = {
      slope: row[:slope]&.to_i,
      intercept: row[:intercept]&.to_i,
      base: row[:base]&.to_i,
      multiplier: row[:multiplier]&.to_f,
      default: row[:default]&.to_i,
      treshold: row[:treshold]&.to_i
    }
  end
end
