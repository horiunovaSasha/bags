require "./lib/csv_module.rb"
include CsvModule

namespace :my_namespace do
  desc "TODO"
  task csv_saver: :environment do
    load_products()
    load_categories()
  end

end
