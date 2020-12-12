require "./lib/csv_module.rb"
require "./lib/telegram_bot.rb"
include CsvModule
include TelegramBotModule

namespace :my_namespace do
  desc "TODO"
  task csv_saver: :environment do
    load_products()
    #load_categories()
  end

  desc "Bot"
  task bot_runner: :environment do
    run()
  end
end
