class Private:
	privates = ["number"]
	def __init__(self):
		self.number = None
		
	def __setattr__(self, attr, value):
		if attr in self.privates:
			raise Exception
		else:
			print("OK")
			
A = Private()
A.number = 10
