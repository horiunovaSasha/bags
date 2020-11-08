require 'csv'

module CsvModule
    def read_csv
        table = CSV.parse(File.read("/Users/okoshman/projects/ruby/rails/bags/lib/categories.csv"), headers: true)
        table.each do |item|
            category = Category.new
            category.id = item["Id"]
            category.name  = item["Name"]
            category.parent_id = item["Parent"]
            p (category.id.to_s + " " + category.name.to_s + " " + category.parent_id.to_s) 
        end
    end
  end