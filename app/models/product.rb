class Product < ApplicationRecord


# Import spread and csv file
  def self.import(file)
	  spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by_id(row["id"]) || new
      product.attributes = row.to_hash.slice(*row.to_hash.keys)
      product.save!
    end
	end

  def self.open_spreadsheet(file)
      # xlsx = Roo::Excelx.new(file.path)
     case File.extname(file.original_filename)
     when ".csv" then Csv.new(file.path, nil, :ignore)
     when ".xls" then Roo::Excel.new(file.path)
     when ".xlsx" then Roo::Excelx.new(file.path)
     else raise "Unknown file type: #{file.original_filename}"
    end
  end

# Download or export CSV and Spreadsheet
	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |product|
	      csv << product.attributes.values_at(*column_names)
	    end
	  end
	end

end
