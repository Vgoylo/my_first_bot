require File.expand_path('../config/environment', __dir__)

require 'telegram/bot'

token = '1960253759:AAEaqU6RavaQ0kHMqopHSn5DhrV1oEaR2Bc'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
 
    input = message.text 
    if input.include?('Remind me')
      input.gsub!('Remind me ', '')
      sleep 20
      bot.api.send_message(chat_id: message.chat.id, text: input) 

    end
    # case input 
    # when '/start'
    #   bot.api.send_message(chat_id: message.chat.id, text: 'Hi how are you?') 
    # when'good'
    #   bot.api.send_message(chat_id: message.chat.id, text: '☺️')
    # when 'bad' 

    #   url = "https://loremflickr.com/320/240/#{SecureRandom.random_number(10000)}"
      
    #   bot.api.send_photo(chat_id: message.chat.id, photo: url, caption: 'test')
     
    # end
  end
end
 