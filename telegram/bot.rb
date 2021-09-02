require File.expand_path('../config/environment', __dir__)

require 'telegram/bot'

token = '1960253759:AAEaqU6RavaQ0kHMqopHSn5DhrV1oEaR2Bc'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
 
    input = message.text 
    case input 
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: 'Hi how are you?')
    when'good'
      bot.api.send_message(chat_id: message.chat.id, text: '☺️')
    when 'bad' 
      bot.api.send_message(chat_id: message.chat.id, text: 'Ok')
    end
  end
end
