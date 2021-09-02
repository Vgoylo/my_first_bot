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
      url = 'https://www.cnet.com/a/img/-qQkzFVyOPEoBRS7K5kKS0GFDvk=/940x0/2020/04/16/7d6d8ed2-e10c-4f91-b2dd-74fae951c6d8/bazaart-edit-app.jpg'
      bot.api.send_photo(chat_id: message.chat.id, photo: url, caption: 'test')
    end
  end
end
