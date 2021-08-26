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

    case user.step
    when 'add'
      user.bots.create(username: message.text)
      user.step = 'description'
      user.save
    when 'description'  
      new_bot user.bots.last
      new_bot.description = messag.text 
      new_bot.save
      user.step = nil
      user.save
    when 'delete'
    when 'search' 
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

