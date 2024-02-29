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
end
