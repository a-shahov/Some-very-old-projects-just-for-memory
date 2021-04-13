def gis(A):
	""" Считает длину Наибольшей Возрастающей Подпоследовательности """
	F = [0]*(len(A) + 1)
	for i in range(1, len(A)+1):
		for j in range(i-1):#j<i
			if A[i-1] > A[j] and F[j+1] > F[i]:
				F[i] = F[j+1]
		F[i] += 1
	print(max(F))
	return F
	
def gis_recovery(A, F):
	""" Восстанавливает НВП """
	max_index = 0
	max_element = F[0]
	for i in range(1, len(F)):
		if max_element < F[i]:
			max_element = F[i]
			max_index = i
	C = []
	C.append(A[max_index - 1])
	max_element = A[max_index - 1]
	for k in range(max_index - 2, -1, -1):
		if A[k] < max_element:
			C.append(A[k])
			max_element = A[k]
	C.reverse()
	return C
	

A = [1,1,1,1,1,1,2,1,1,2,3,1,1,1]				
F = gis(A)
print(gis_recovery(A, F))
