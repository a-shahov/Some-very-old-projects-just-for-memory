import telebot
import config

#Создание бота
bot = telebot.TeleBot(config.Token)



@bot.message_handler(commands = ['start'])

def k(message):
		bot.send_message(message.chat.id, 'Приветствую, спросите меня о чем-нибудь')


@bot.message_handler(content_types = ['text'])

def t(message):
		bot.send_message(message.chat.id, 'Я определил, что вы пидор и стриптизёр')


#хуета полная этот ебучий курс по ботам
'''@bot.message_handler(commands=['test'])
def find_file_ids(message):
    for file in os.listdir('music/'):
        if file.split('.')[-1] == 'ogg':
            f = open('music/'+file, 'rb')
            msg = bot.send_voice(message.chat.id, f, None)
            bot.send_message(message.chat.id, msg.voice.file_id, reply_to_message_id=msg.message_id)
            f.close()
        time.sleep(3)'''

if __name__ == '__main__':
	bot.infinity_polling()
