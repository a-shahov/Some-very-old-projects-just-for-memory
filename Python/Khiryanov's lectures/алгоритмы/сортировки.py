from random import randint

def insert_sort(A):
	""" Сортировка вставками """
	for k in range(1, len(A)):
		for p in range(k):
			if A[k-p] < A[k-p-1]:
				A[k-p], A[k-p-1] = A[k-p-1], A[k-p]
	
def choise_sort(A):
	""" Сортировка выбором """
	for k in range(len(A)-1):
		for p in range(k+1, len(A)):
			if A[k] > A[p]:
				A[k], A[p] = A[p], A[k]
	
def bubble_sort(A):
	""" Сортировка пузырьком """
	for k in range(len(A)-1):
		for p in range(len(A)-1-k):
			if A[p] > A[p+1]:
				temp = A[p]
				A[p] = A[p+1]
				A[p+1] = temp
	
def count_sort(A):
	""" Сортировка подсчётом """	
	max_element = max(A)
	lenght_mass = len(A)
	B = [0] * (max_element + 1)
	#Частотный анализ
	for k in range(lenght_mass):
		B[A[k]] += 1
	A = []
	for k in range(max_element + 1):
		for p in range(B[k]):
			A.append(k)
	return A
	
A = [randint(1,40) for x in range(15)]
print(A)
A = count_sort(A)
print(A)
