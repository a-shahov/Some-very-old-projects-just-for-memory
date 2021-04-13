def Tracer(classname, supers, classdict):
	aClass = type(classname, supers, classdict)
	class Wrapper:
		def __init__(self, *args):
			self.wrapped = aClass(*args)
		def __getattr__(self, attr):
			return getattr(self.wrpapped, attr)
		def __str__(self):
			print("Это что?")
			return object.__str__(self)
	return Wrapper

class Person(metaclass=Tracer): pass

A = Person()
print(A)
print(A.wrapped)
print("--" * 10)

class Meta(type):
	def __new__(meta, classname, supers, classdict):
		print(meta, classname, supers, classdict, sep="\n...")
		return type.__new__(meta, classname, supers, classdict)
	def __init__(Class, classname, supers, classdict):
		print(Class, classname, supers, classdict, sep="\n...")

class test(metaclass=Meta): pass
