def z_func(s:str):
	"""
	Алгоритм z-функции
	ищет максимальный общий префикс s и s[i:]
	
	>>> z_func("aaaaa")
	[0, 4, 3, 2, 1]
	>>> z_func("aaabaab")
	[0, 2, 1, 0, 2, 1, 0]
	>>> z_func("abacaba")
	[0, 0, 1, 0, 3, 0, 1]
	"""
	z = [0] * len(s)
	l, r = 0, 0
	for i in range(1, len(s)):
		if i > r:
			z[i] = 0
			while i+z[i] < len(s) and s[z[i]] == s[z[i]+i]:
				z[i] += 1
			if z[i] > 0:
				l, r = i, i + z[i] - 1
		else:
			z[i] = min(z[i-l], r-i+1)
			while i+z[i] < len(s) and s[z[i]] == s[z[i]+i]:
				z[i] += 1
			if z[i] > 0:
				l, r = i, i + z[i] - 1
	return z

if __name__ == "__main__":
	import doctest
	doctest.testmod()
			 

