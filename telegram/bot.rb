require File.expand_path('../config/environment', __dir__)

require 'telegram/bot'

token = '1960253759:AAEaqU6RavaQ0kHMqopHSn5DhrV1oEaR2Bc'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if message.text.include?('Hello')
      bot.api.send_message(chat_id: message.chat.id, text: "123456789")
    end
  end
end

