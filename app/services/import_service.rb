# frozen_string_literal: true

class ImportService
  require 'csv'

  def import_resources(file)
    opened_file = File.open(file.path)
    options = { headers: true, header_converters: :symbol, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      Resource.find_or_create_by(
        key: row[:key],
        name: row[:name]
      )
    end
  end

  def import_structures(file)
    opened_file = File.open(file.path)
    options = { headers: true, header_converters: :symbol, col_sep: ',' }
    CSV.foreach(opened_file, **options) do |row|
      Structure.find_or_create_by(
        key: row[:key],
        name: row[:name],
        description: row[:description]
      )
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
end
