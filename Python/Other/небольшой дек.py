class dec:
	def __init__(self, func):
		self.func = func
		
	def __call__(self):
		print("Запускаем...")
		self.func()

@dec
def A():
	print("Fuck")
	
@dec 
def A():
	print(123124)
	
A()
