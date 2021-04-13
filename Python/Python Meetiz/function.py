def name(nick = 0, first = 1, last = 2, job = 3, cat = {}):
	
	if nick == 0:
		nick = input('Введите ваш псевдоним: ')
	if first == 1:
		first = input('Введите ваше имя: ')
	if last == 2:
		last = input('Введите вашу фамилию: ')
	if job == 3:
		job = input('Введите название вешей работы: ')
    
	nick = nick.strip().lower().title()
	first = first.strip().lower().title()
	last = last.strip().lower().title()
	job = job.strip().lower().title()
	
	cat[nick] = dict(first=first, last=last, job=job)
				
	return cat
	
		
#Список участников

answer = input('Вы хотите начать заполнение списка участников? да/нет: ')
answer1 = 'да'
catalog = {}

while answer == 'да' and answer1 == 'да':
	answer1 = ''
	print('\n')
	catalog = name(cat = catalog)
	answer1 = input('\nДобавить ещё одного участника? да/нет: ')

print(catalog)
