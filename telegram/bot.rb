require File.expand_path('../config/environment', __dir__)

require 'telegram/bot'

token = '1960253759:AAEaqU6RavaQ0kHMqopHSn5DhrV1oEaR2Bc'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|

    if !User.exists?(telegram_id: message.from.id)
      user = User.create(telegram_id: message.from.id, name: message.from.first_name)
    else 
      user = User.find_by(telegram_id: message.from.id)
    end

    case message.text
    when "/add"
      user.step = 'add'
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Send me bot username')
    when "/delete" 
      user.step = 'delete'
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Pick bot to delete')
    when '/search' 
      user.step = 'search'  
      user.save
      bot.api.send_message(chat_id: message.chat.id, text: 'Send me your request')
    end  
  end
end

