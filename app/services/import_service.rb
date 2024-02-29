# frozen_string_literal: true

class ImportService
  require 'csv'
  require 'json'

  def import_resources(file)
    opened_file = File.open(file.path)
    options = { headers: true, header_converters: :symbol, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      resource = Resource.find_or_create_by(
        key: row[:key],
        name: row[:name]
      )

      IdleGame.all.each do |idle_game|
        IdleGameResource.find_or_create_by(resource:, idle_game:) do |resource_game|
          resource_game.quantity = 0
        end
      end
    end
  end

  def import_structures(file)
    opened_file = File.open(file.path)
    options = { headers: true, header_converters: :symbol, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      structure = Structure.find_or_create_by(
        key: row[:key],
        name: row[:name],
        description: row[:description]
      )

      IdleGame.all.each do |idle_game|
        IdleGameStructure.find_or_create_by(structure:, idle_game:) do |resource_game|
          resource_game.level = 0
        end
      end
    end
  end

  def import_resource_requirements(file)
    opened_file = File.open(file.path)
    options = { headers: true, header_converters: :symbol, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      StructureRequirement.find_or_create_by(
        structure: Structure.find_by(key: row[:structure]),
        required_structure: Structure.find_by(key: row[:required_structure]),
        required_level: row[:level]
      )
    end
  end

  def import_resource_formulas(file)
    opened_file = File.open(file.path)
    options = { headers: true, header_converters: :symbol, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      structure_formula = StructureFormula.find_or_initialize_by(
        structure: Structure.find_by(key: row[:structure]),
        resource: Resource.find_by(key: row[:resource]) || nil,
        category: row[:category],
        formula: row[:formula]
      )

      add_formula_arguments(structure_formula, row)

      structure_formula.save!
    end
  end

  private

  def add_formula_arguments(structure_formula, row)
    structure_formula.arguments = {
      slope: row[:slope]&.to_i,
      intercept: row[:intercept]&.to_i,
      base: row[:base]&.to_i,
      multiplier: row[:multiplier]&.to_i,
      default: row[:default]&.to_i,
      treshold: row[:treshold]&.to_i
    }
  end
end
