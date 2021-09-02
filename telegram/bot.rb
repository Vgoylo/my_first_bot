require File.expand_path('../config/environment', __dir__)

require 'telegram/bot'

token = '1960253759:AAEaqU6RavaQ0kHMqopHSn5DhrV1oEaR2Bc'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    #bot.api.send_message(chat_id: message.chat.id, text: 'End to your phone number')
    input = message.text 
    if input.match?(/(\+375|80)(29|44|33|25)\d{3}\d{2}\d{2}$/)
    
      if input.match?(/(\+375|80)(25)\d{7}/)
        bot.api.send_message(chat_id: message.chat.id, text: 'Life')
      else
        incorrect_number(bot)
      end
       
      if input.match?(/(\+375|80)(29(1|3|9)|44(4|5|7))\d{6}/)
        bot.api.send_message(chat_id: message.chat.id, text: 'Velcome')
      else
        incorrect_number(bot)
      end

      if input.match?(/(\+375|80)(29(2|4|6|8)|33(6|9|3))\d{6}/)
        bot.api.send_message(chat_id: message.chat.id, text: 'Mts')
      else
        incorrect_number(bot)
      end

    else
      incorrect_number(bot)
    end
  end
end

def incorrect_number(bot)
  bot.api.send_message(chat_id: message.chat.id, text: 'Please enter correct phone number')
end

