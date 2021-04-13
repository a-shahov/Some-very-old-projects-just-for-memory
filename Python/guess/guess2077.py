import random
import json

filename = 'gamers.json'

print('Угадай число 2077, круче Cyberpunk 2077\n'
	  + 'Ваша задача ввести игровой интервал'
	  + '\nВнутри которого игра загадет число'
	  + '\nИ вам нужно будет угадать загаданное число'
	  + '\nДлина стандартного интервала 100\n')

def end(m,a,b):
	'''Функция подсчёта призовых очков'''
	
	value = ((b-a) * 4) * (2/(2 ** m)) #Вес выигрыша
	
	print('Поздравляю, вы угадали, вы получаете ' + str(value)
	      +' призовых очков')
	      
	return value     
	
def gen():
	'''Создаёт интервал, в котором будет загадано число'''
	
	a = input('Введите нижнюю границу интервала: ')
	b = input('Введите верхнюю границу интервала: ')
	
	if a:
		try:
			a = int(a.strip())
		except ValueError:
			print('Вы ввели некорректное знаение! по умолчанию а = 1')
			a = 1
	
	if b:
		try:
			b = int(b.strip())
		except ValueError:
			b = a + 100
			print('Вы ввели некорректное знаение! по умолчанию b = ' + str(b))		
			
	x = random.randint(a,b) #Загаданное число
	dx = (b-a) * 0.01 * random.randint(8,14) #Интервал x
	
	print('\nДа начнётся игра!!!' 
		  + '\nЗагадано некоторое число в интервале от ' 
		  + str(a) + ' до ' + str(b)
		  + '\nУчтите что количество призовых очков убывает' 
		  + '\nпо экспоненте от количества ваших попыток\n')
		
	interval = [a, b, x, dx]
	
	return interval
	
def game():
	'''Функция игровой итерации'''
	
	mesup = 'Нет, загаданное число больше'
	mesdown = 'Нет, загаданное число меньше'
	mesupsl = 'Вы почти угадали, но загаданное число немного больше'
	mesdownsl = 'Вы почти угадали, но загаданное число немного меньше'
	mesgreat = 'Потрясающе, удача на вашей стороне'
	mes = [mesup, mesdown, mesupsl, mesdownsl, mesgreat]
		
	interval = gen()

	aktive = True
	n = 0 #Количество итераций

	while aktive:
		y = int(input('Введите ваше число: '))
		n += 1
		if y < interval[2] - interval[3]:
			print(mes[0])
		elif y < interval[2]:
			print(mes[2])
		elif y == interval[2]:
			if n == 1 :
				print(mes[4])
			value = end(n,interval[0],interval[1])
			aktive = False
		elif y > interval[2] + interval[3]:
			print(mes[1])
		elif y > interval[2]:
			print(mes[3])
			
	return value
	
def load1():
	try:
		obj = open(filename, 'r')
		gamers = json.load(obj)
		obj.close()
		
	except FileNotFoundError:
		gamers = {}
		
	return gamers
	
def save(gamer):
	obj = open(filename, 'w')
	json.dump(gamer,obj)
	obj.close()

def players():
	players1 = []
	
	while True:
		a = input('\nВведите ник игрока: ')
		players1.append(a.strip())
		ans = input('Будут ещё игроки? yes/no: ')
		if ans.strip().lower() != 'yes':
			break
			
	return players1
	
	
	
gamers = load1()
names = players()
p = 1

while True:
	for x in names:
		print('\n' + '         ' + str(p) +' попытка игрока ' + x)
		value = game()
		
		try:
			gamers[x] += value
		except KeyError:
			gamers[x] = value
			
	answer = input('\nПродолжить игру? yes/no: ')
	if answer.lower() != 'yes':
		break
	else:
		p += 1

save(gamers)
print('\n         Результат игры\n')

for nick,points in gamers.items():
	print(nick + ' набрал ' + str(points) + ' призовых очков')
