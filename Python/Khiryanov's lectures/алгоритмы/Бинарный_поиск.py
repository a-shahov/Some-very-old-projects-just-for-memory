def left_bound(A, key):
	""" Бинарный поиск левой границы """
	left = -1
	right = len(A)
	while right - left > 1:
		middle = (left + right)//2
		if A[middle] < key:
			left = middle
		else:
			right = middle
	return left
	
def right_bound(A, key):
	""" Бинарный поиск правой границы """
	left = -1
	right = len(A)
	while right - left > 1:
		middle = (left + right)//2
		if A[middle] <= key:
			left = middle
		else:
			right = middle
	return right
