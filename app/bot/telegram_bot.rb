require 'telegram/bot'
require_relative 'weather'

TOKEN = '430201945:AAF9e7bUYKHHYZu8buYPnoHYYNMPEaVsfhc'.freeze

bot = TelegramBot.new(TOKEN)

bot.listen(method: :webhook, url: '/meow/meow')  # not implemented yet
# or
bot.listen(method: :poll, interval: 1)