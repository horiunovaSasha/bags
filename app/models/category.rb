require "./lib/csv_module.rb"

class Category < ApplicationRecord
    include CsvModule
end