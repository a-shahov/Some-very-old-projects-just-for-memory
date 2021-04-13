def lcs(A, B):
	F = [[0]*(len(B) + 1) for i in range(len(A) + 1)]
	C = []
	for i in range(1, len(A) + 1):
		for j in range(1, len(B) + 1):
			if A[i-1] == B[j-1]:
				F[i][j] = 1 + F[i-1][j-1]	
				if len(C) < F[i][j]:
					C.append(A[i-1])
			else:
				F[i][j] = max(F[i][j-1], F[i-1][j])
	print(C)				
	print(F)
	return F


def func(F, A, B):
	""" Восстанавливвет ОП """
	C = []
	for i in range(len(F)-1,0,-1):
		for j in range(len(F[1])-1,0,-1):
			if (A[i-1] == B[j-1]) and F[i][j] > max(F[i][j-1], F[i-1][j]):
				C.append(A[i-1]) 
	C1 = [0] * len(C)
	k = len(C) - 1
	for x in C:
		C1[k] = x
		k -= 1
	return C1

A = [1,1,2]
B = [1,1,1,2]
print(A,B, sep="\n")

F = lcs(A, B)
print(func(F, A, B))
