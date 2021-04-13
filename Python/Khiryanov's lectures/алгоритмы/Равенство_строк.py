#Алгоритм Кнута-Морриса-Пратта, реализация pi функции

def pi_func(A:list):
	""" Ищет максимальную длину соб. суффикса,
		который равен префиксу для всех A[:i]
	"""
	pi = [0] * len(A)
	for i in range(1,len(A)):
		p = pi[i-1]#Длины 1 это нулевой индекс, длины 2 это 1 первый индекс
		while p > 0 and A[p] != A[i]:
			p = pi[p-1]#Подстрока длины p это индекс p-1
		if A[i] == A[p]:#A[i] - новый добавленный элемент 			
			p += 1		#A[p] - +1 элемент к префиксу длины p, у него последний A[p-1]
		pi[i] = p#строка длины i+1 индекс i 
	return pi

def KNP(S, sub):
	""" Ищет подстроку в строке 
		Алгоритм Кнута-Морриса-Пратта
	"""
	sum_string = sub + '#' + S
	pi_list = pi_func(sum_string)
	for i in range(2*len(sub), len(sum_string)):
		if pi_list[i] == len(sub):
			print("Вхождение подстроки с индекса:", i - 2*len(sub), "Включительно")
	print("Больше нету вхождений")
	
