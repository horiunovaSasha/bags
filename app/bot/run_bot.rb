require 'telegram_bot'

TOKEN = '1430201945:AAF9e7bUYKHHYZu8buYPnoHYYNMPEaVsfhc'.freeze

bot = TelegramBot.new(token: TOKEN)


bot.listen(method: :poll, interval: 1)

bot.on :command, 'ping' do  # /ping
    reply 'pong'
  end
  
  bot.on :command, 'plus' do |num1, num2|  # /plus 1 2
    reply (num1.to_i + num2.to_i).to_s
  end
  
  # a simple history logger
  bot.on :anything do |msg|
    #Database.save [msg.from.username, msg.text] if !msg.text.empty?
  end

trap(:INT) {
    bot.stop!
}
bot.start!
    