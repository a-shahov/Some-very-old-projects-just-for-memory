def gen():
	for i in range(10):
		x = yield i ** 3
		print(x)
		
G = gen()
print(next(G))
print(next(G))
print(next(G))
print(G.send(100))
#получается метод send передает значение выражению yield
