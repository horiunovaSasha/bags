require 'csv'

module CsvModule
    def load_categories
        table = CSV.parse(File.read("/Users/okoshman/projects/ruby/rails/bags/lib/categories.csv"), headers: true)
        table.each do |item|
            Category.find_or_create_by(:id => item["Id"], :name => item["Name"], :parent_id => item["Parent"])
        end
    end
  end