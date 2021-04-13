def bank(A, K):
	""" Находит минимальное число банкнот чтобы выдать сумму K """
	F = [0] * (K+1)
	for k in range(1,K+1):
		min_var = 10 ** 10
		for i in range(len(A)):
			if k - A[i] >= 0 and F[k - A[i]] < min_var:
				min_var = F[k - A[i]]
		F[k] = min_var + 1
	return F[-1]

def backpack(W, P, K):
	""" Дискретная задача об укладке рюкзака
		W - веса, P - стоймости, K - максимальный вес
	"""
	F = [ [0]*(K+1) for i in range(len(W)+1)]
	
	for i in range(1, len(W)+1):
		for k in range(1, K+1):
			if k >= W[i]:
				F[i][k] = max(F[i-1][k], F[i-1][k-W[i]] + P[i])
			else:
				F[i][k] = F[i-1][k]
				
	return F[-1][-1]
