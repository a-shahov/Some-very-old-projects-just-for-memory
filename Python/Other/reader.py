import sys


class Processor:
	
	def __init__(self, reader, writer):
		self.reader = reader
		self.writer = writer
		self.number = 10
		
	def process(self):
		for line in self.reader:
			line = self.converter(line)
			self.writer.write(line)
			
	def converter(self):
		assert False
		

class Uppercase(Processor):
	
	def converter(self, line):
		return line.upper()
		
	def unf(obj):
		print(obj)
		
	unf = classmethod(unf)
		

test = Uppercase(open("spam.txt"), sys.stdout)
Uppercase.unf()
test.process()

