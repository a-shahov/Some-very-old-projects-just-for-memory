class First:
	count = 0
	
	def __init__(self):
		self.increase()
	
	@staticmethod	
	def increase():
		First.count += 1
		

class Second(First):
	count = 0

a = Second()
b = Second()
v = Second()
c = Second()

class MyExc(Exception):
	pass


try:
	raise MyExc
except MyExc:
	print("&&&&")


	
