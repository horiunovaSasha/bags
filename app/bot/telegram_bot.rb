require 'telegram/bot'
require './weather'
require '../models/category.rb'

class TelegramBot
  TOKEN = '1430201945:AAF9e7bUYKHHYZu8buYPnoHYYNMPEaVsfhc'.freeze

  def run
    bot.listen do |message|
      puts message.from.first_name
      case message.text
        when '/start'
    	    bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    	    bot.api.sendMessage(chat_id: message.chat.id, text: "Type /categories to get the list of categories")
    	when '/categories'
    	    text = ""
    	    Category.All.each do |item|
		text = "#{text} #{item.title}"
	    end
    	    bot.api.sendMessage(chat_id: message.chat.id, text: text)
        else
	    bot.api.sendMessage(chat_id: message.chat.id, text: "I don't understand you at all!")
        end
    end
  end


  private

  def bot
    Telegram::Bot::Client.run(TOKEN) { |bot| return bot }
  end

  def weather_message(message)
    return unless message.text.include? '/weather'

    send_message(message.chat.id, Weather.new(city_name(message.text)).form_message)
  end

  def city_name(text)
    text.gsub('/weather', '').strip.tr(' ', '+')
  end

  def send_message(chat_id, message)
    bot.api.sendMessage(chat_id: chat_id, text: message)
  end
end