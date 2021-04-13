def fib(n):
	""" ТАК НЕЛЬЗЯ ПИСАТЬ """
	if n <= 1:
		return n
	return fib(n-1) + fib(n-2)

N = 100
fibo = [0, 1] + [0] * (N - 1)
for i in range(2, N + 1):
	fibo[i] = fibo[i-1] + fibo[i-2]

N = 5
allowed = [True] * N
allowed[0] = allowed[4] = allowed[2] = False

def count_tr(N, allowed:list):
	""" Считает количество возможных траекторий 
		достижения N
		доступные прыжки +1, +2, +3
	"""
	K = [0, 1, int(allowed[2]), 2 * int(allowed[3])] + [0] * (N - 3)
	for i in range(4, N+1):
		K[i] = K[i-1] + K[i-2] + K[i-3]
	return K[N]
	
print(count_tr(N, allowed))
