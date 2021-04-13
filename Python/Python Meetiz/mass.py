class Massive():
	
	def __init__(self, s):
		self.s = s
		self.max1 = 0
		self.min1 = 0
		self.s1 = []
		
	def summa(self):
		sum1 = sum(self.s)
		print(str(sum1) + ' - сумма элементов')
	
	def composition(self):
		comp1 = 1
		for x in self.s:
			comp1 *= x
		print(str(comp1) + ' - произведение элементов')
	
	def maximum(self):
		self.max1 = max(self.s)
		print('Максимальный элемент: ' + str(self.max1))
		
	def quantitymax(self):
		nmax = 0
		aktiv1 = True
		self.max1 = max(self.s)
		self.s1 = self.s[:]
		while aktiv1:
			if self.max1 in self.s1:
				self.s1.remove(self.max1)
				nmax += 1
			else: 
				aktiv1 = False
		print('Количество значений равных максимальному в массиве: '+str(nmax))

	def minimum(self):
		self.min1 = min(self.s)
		print('Минимальный элемент: ' + str(self.min1))
		
	def quantitymin(self):
		nmin = 0
		aktiv2 = True
		self.min1 = min(self.s)
		s2 = self.s[:]
		while aktiv2:
			if self.min1 in s2:
				s2.remove(self.min1)
				nmin += 1
			else: 
				aktiv2 = False
		print('Количество значений равных максимальному в массиве: '+str(nmin))	

ss1 = [1,1]
for x in range(0,11):
	ss1.append(ss1[x]+ss1[x+1])

fibbo = Massive(ss1)

fibbo.quantitymax()
fibbo.quantitymin()
fibbo.summa()
fibbo.composition()
fibbo.maximum()
fibbo.minimum()

