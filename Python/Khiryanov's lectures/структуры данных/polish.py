import A_stack

def notation(A):
	"""
	Обратная польская нотация
	
	>>> notation([2, 7, "**", 2, 8, "**", "-"])
	-128
	>>> notation([2, 7, 5, "*", "+"])
	37
	"""
	for token in A:
			
		if token == "+":
			x = A_stack.pop()
			y = A_stack.pop()
			z = y + x
			A_stack.push(z)
		elif token == "*":
			x = A_stack.pop()
			y = A_stack.pop()
			z = y * x
			A_stack.push(z)
		elif token == "/":
			x = A_stack.pop()
			y = A_stack.pop()
			z = y / x
			A_stack.push(z)
		elif token == "-":
			x = A_stack.pop()
			y = A_stack.pop()
			z = y - x
			A_stack.push(z)
		elif token == "//":
			x = A_stack.pop()
			y = A_stack.pop()
			z = y // x
			A_stack.push(z)
		elif token == "%":
			x = A_stack.pop()
			y = A_stack.pop()
			z = y % x
			A_stack.push(z)
		elif token == "**":
			x = A_stack.pop()
			y = A_stack.pop()
			z = y ** x
			A_stack.push(z)
		else:
			A_stack.push(token)
			
	return A_stack.pop()
	
if __name__ == "__main__":
	import doctest
	doctest.testmod()
