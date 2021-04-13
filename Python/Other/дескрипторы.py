class Person:
	def __init__(self, name):
		self._name = name
	def getName(self):
		print("get...")
		return self._name
	def setName(self, value):
		print("change...")
		self._name = value
	def delName(self):
		print("remove...")
		del self._name
	name = property(getName, setName, delName)

A = Person("Андрей")
print(A.name)
del A._name
A.name = "egrt"
print(A.name)

class Person1:
	
	class Name:
		def __get__(self, inst, own):
			print(own)
			return inst._name
		def __set__(self, inst, value):
			inst._name = value
		def __delete__(self, inst):
			del inst._name
	
	name = Name()
			
	def __init__(self, name):
		self._name = name

class DASD(Person1): ...


A = DASD("Bob")
print(A.name)
