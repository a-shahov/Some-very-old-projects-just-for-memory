import telebot
import config

bot = telebot.TeleBot(config.Token)

@bot.message_handler(content_types=['text'])

def lala(message):
	bot.send_message(message.chat.id, 'fuck')
	
bot.polling(none_stop=True)
