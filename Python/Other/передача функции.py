class Test:
	def __init__(self):
		self.name = "Bob"
		
	def func(self):
		print(self.name)
		
	class Name:
		
		def __init__(self, func):
			self.func = func
			
		def __get__(self, inst, own):
			self.func(inst)
			
	A = Name(func)
	
A = Test()


class Prop:
	def __init__(self, fset):
		self.fset = fset
	
	def setter(self, fset):
		self.fset = fset
	
	def __get__(self, inst, own):
		print(inst._name)
		
	def __set__(self, inst, value):
		self.fset(inst, value)
		
class Person:
	
	def __init__(self, name):
		self._name = name
	
	@Prop
	def name(self):
		return self._name
	
	@name.setter
	def setName(self, value):
		 self._name = value * 100
		 
A = Person(7)
A.name = 20
A.name
	
	
	
	
	
	
	
	
	
	
	
	
	
