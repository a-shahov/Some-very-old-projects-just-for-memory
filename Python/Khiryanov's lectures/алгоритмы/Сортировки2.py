def check_sorted(A, ascending=True):
	""" Проверка отсортированнности массива за O(N) """
	#int(True) = 1
	flag = True
	s = 2 * int(ascending) - 1
	for i in range(len(A) - 1):
		if s * A[i] >= s * A[i+1]:
			flag = false
			break
	return flag



def hoar_sort(A):
	""" Сортировка Тони Хоара """
	if len(A) <= 1:
		return
	barrier = A[0]
	L, M, R =  [], [], [] #Ссылочная модель питона!!!
	for x in A:
		if x < barrier:
			L.append(x)
		elif x == barrier:
			M.append(x)
		else:
			R.append(x)
	hoar_sort(L)
	hoar_sort(R) 
	k = 0
	for x in L+M+R:
		A[k] = x
		k += 1

def merge(A:list, B:list):
	""" Слияние отсортированных массивов """
	C = [0] * (len(A) + len(B))
	i, k, n = 0
	while i < len(A) and k < len(B):
		if A[i] <= B[k]: #Устойчивая сортировка
			C[n] = A[i]
			n += 1
			i += 1
		else:
			C[n] = B[k]
			n += 1
			k += 1
	while i < len(A):
			C[n] = A[i]
			n += 1
			i += 1
	while k < len(B):
			C[n] = B[k]
			n += 1
			k += 1
	return С
	
def merge_sort(A):
	""" Сортировка слиянием """
	if len(A) <= 1:
		return 
	middle = len(A)//2
	L = [A[i] for i in range(middle)]
	R = [A[i] for i in range(middle, len(A))]
	merge_sort(L)
	merge_sort(R)
	C = merge(L, R)
	for i in range(len(A)):
		A[i] = C[i]
