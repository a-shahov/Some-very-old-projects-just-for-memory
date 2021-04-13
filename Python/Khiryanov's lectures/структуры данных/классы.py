class Goat:
	
	def __init__(self, height, weight):
		self.legs_number = 4
		self.height = height
		self.weight = weight
	
	def __str__(self):
		s = "weight = {}, height = {}".format(self.height, self.weight)
		return s
		
class LinkedList:
	"""
	Односвязный список
	"""
	
	def __init__(self):
		self._begin = None
	
	def insert(self, x):
		self._begin = [x, self._begin]
	
	def pop(self):
		assert self._begin is not None, "List empty"
		x = self._begin[0]
		self._begin = self._begin[1]
		return x 
	
class Heap:
	
	def __init__(self):
		self.values = []
		self.size = 0
	
	def __str__(self):
		s = "{}".format(self.values)
		return s
	
	def insert(self, x):
		 self.values.append(x)
		 self.size += 1
		 self.sift_up(self.size-1)
		 
	def sift_up(self, i):
		"""
		O(log(n))
		""" 
		while i != 0 and self.values[i] < self.values[(i-1)//2]:
			 self.values[i], self.values[(i-1)//2] = (
				self.values[(i-1)//2], self.values[i])
			 i = (i - 1) // 2
	
	def extract_min(self):
		assert self.size, "Heap empty"
		tmp = self.values[0]
		self.values[0] = self.values[-1]
		self.values.pop()
		self.size -= 1
		self.sift_down(0)
		return tmp
	
	def sift_down(self, i):
		"""
		O(log(n))
		"""
		while 2*i + 1 <= self.size - 1 :
			j = i
			if self.values[i] > self.values[i*2 + 1]:
				
				self.values[i], self.values[i*2 + 1] = (
					self.values[i*2 + 1], self.values[i])
				i = i*2 + 1
			
			if j*2 + 2 <= self.size - 1 and self.values[j] > self.values[j*2 + 2]:
				
				self.values[j], self.values[j*2 + 2] = (
					self.values[j*2 + 2], self.values[j])
				
				j = j*2 + 2
			
			if j == i:
				break
				

def heapify_fast(A):
	"""
	Быстрая сортровка O(N)
	len(A)//2 - количество элементов, имеющих потомков
	"""
	heap = Heap()
	heap.values = A[:]
	heap.size = len(A)
	for i in reversed(range(len(A)//2)):
		heap.sift_down(i)
	B = []
	for i in range(len(A)):
		B.append(heap.extract_min())
	return B
	

class queue:
	"""
	Очередь
	
	>>> A = queue()
	>>> A.add(1)
	>>> A.add(2)
	>>> A.add(3)
	>>> A.pop()
	1
	>>> A.pop()
	2
	>>> A.pop()
	3
	>>> A.add(3)
	>>> A.clear()
	>>> A.len()
	0
	>>> A.add(1)
	>>> A.add(2)
	>>> A.pop()
	1
	
	"""
	
	def __init__(self):
		self._next = None
		self._first = None
		self.size = 0
	
	def add(self, x):
		if self._first is None:
			self._first = [x, self._next, self._first]
		elif self._first[1] is None:
			self._next = [x, None, self._first]
			self._first[1] = self._next
		else:
			tmp = self._next
			self._next = [x, None, self._first]
			tmp[1] = self._next
		self.size += 1
	
	def pop(self):
		assert self.size, "Очередь пуста"
		x = self._first[0]
		self._first = self._first[1]
		if self._first is not None:
			self._first[2] = None
		self.size -= 1
		
		return x
	
	def clear(self):
		self._next = None
		self._first = None
		self.size = 0		
		
	def len(self):
		return self.size


if __name__ == "__main__":
	import doctest
	doctest.testmod()
	
	
