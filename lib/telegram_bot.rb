require 'telegram/bot'

module TelegramBotModule
  TOKEN = '1430201945:AAF9e7bUYKHHYZu8buYPnoHYYNMPEaVsfhc'.freeze

  def run
    bot.listen do |message|
      puts message.from.first_name
      case message
	when Telegram::Bot::Types::Message
    	    case message.text
    	    when '/start'
    		bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    		bot.api.sendMessage(chat_id: message.chat.id, text: "Type /categories to get the list of categories")
    	    when '/categories'
    		kb = []
    		Category.all.each do |item|
		    kb.push(Telegram::Bot::Types::InlineKeyboardButton.new(text: item.name, callback_data: item.id))
		end

		markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
    		bot.api.sendMessage(chat_id: message.chat.id, text: 'Categories:', reply_markup: markup)
	    else
		bot.api.sendMessage(chat_id: message.chat.id, text: 'I don''t understand you at all!')
	    end
	when Telegram::Bot::Types::CallbackQuery
	    Product.joins(product_categories: :category, product_images: :image).where(categories: {id: message.data.to_i}).uniq.each do |item|
		kb = [
		    Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Go to the website', url: "https://fancy-bags.herokuapp.com/products/#{item.id}")
		]
		markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
		bot.api.sendPhoto(chat_id: message.from.id, caption: "#{item.title}\n\r#{item.description}", photo: item.product_images.first.image.path, reply_markup: markup)
		
	    end
        else
	    bot.api.sendMessage(chat_id: message.from.id, text: "unknown command")
        end
    end
  end


  private

  def bot
    Telegram::Bot::Client.run(TOKEN) { |bot| return bot }
  end
end