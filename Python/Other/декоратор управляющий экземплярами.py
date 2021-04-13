def track(cls):
	class wrapper:
		def __init__(self, *args):
			self.count = 0
			self.cls = cls(*args)
		def __getattr__(self, attr):
			self.count += 1
			print("Вызов номер:", self.count)
			return getattr(self.cls, attr)
		def __setattr__(self, attr, value):
			if attr in ["count", "cls"]:
				self.__dict__[attr] = value
			else:
				#тут спорный момент, но вроде всё ок, какой self передаётся?))) 
				self.__dict__["cls"].__setattr__(attr, value) 
	return wrapper
	
@track
class Spam:
	def __init__(self, name):
		self.name = name
	def prt(self):
		print(self.name)
		
A = Spam(12)
A.prt()
A.prt()
A.name = "fdsfds"
print(A.__dict__)
A.prt()
B = Spam("fylhqt")
B.prt()
