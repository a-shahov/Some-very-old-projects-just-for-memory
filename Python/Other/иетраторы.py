class SkipIterator:
	def __init__(self, wrapped):
		self.wrapped = wrapped

a = SkipIterator([1,23,5,6,7])
b = a.wrapped
b.append(777)
print(a.wrapped)
