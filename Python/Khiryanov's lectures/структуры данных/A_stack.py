"""
Структура данных - стек
>>> clear()
>>> push(1)
>>> push(2)
>>> push(3)
>>> is_empty()
False
>>> pop()
3
>>> pop()
2
>>> pop()
1
>>> is_empty()
True
"""

_stack = []

def push(x):
	"""
	Добавляет элемент x в конец стека
	
	>>> size = len(_stack)
	>>> push(5)
	>>> len(_stack) - size
	1
	>>> _stack[-1]
	5
	"""
	_stack.append(x)

def pop():
	return _stack.pop()
	
def clear():
	_stack.clear()
	
def is_empty():
	return len(_stack) == 0


if __name__ == "__main__":
	import doctest
	doctest.testmod()
