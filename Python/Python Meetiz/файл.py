#Редактирует число pi и нарезает его на числа которые кончаются на 3
#Выводит сумму таких чисел

with open('C:/Users/Андрей/Desktop/pi.txt') as file_object:
	pi = file_object.readlines()
	n = 0
	a = ''
	summ = 0
	for x in pi:
		pi[n] = pi[n].strip()
		for y in pi[n]:
			if y != '.':
				a += y
		n += 1
	print(a)
	n = 0
	k = 0
	for x in a:
		if x == '3':
			summ += int(a[n:k+1])
			n = k + 1
		k += 1
	print(summ)
