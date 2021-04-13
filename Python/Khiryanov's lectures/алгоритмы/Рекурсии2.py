def generate_numbers(N:int, M:int, prefix=None):
	""" Генерирует все числа
		в N-ричной системе счисления (N <= 10)
		длины M
	"""
	if M == 0:
		print(*prefix, sep='')
		return
	prefix = prefix or [] #Ленивый оператор or
	for digit in range(N):
		prefix.append(digit)
		generate_numbers(N, M-1, prefix)
		prefix.pop()
	
def generate_permutations(N:int, M:int=-1, prefix=None):
	""" Генерирует перестановки
		N чисел в M позициях
	"""
	#по умолчанию N чисел в N позициях
	M = M if M != -1 else N
	if M == 0:
		print(*prefix, sep='')
		return
	prefix = prefix or []
	for digit in range(1, N+1):
		if not digit in prefix:
			prefix.append(digit)
			generate_permutations(N, M-1, prefix)
			prefix.pop()
				
generate_numbers(2, 4)
generate_permutations(3)

