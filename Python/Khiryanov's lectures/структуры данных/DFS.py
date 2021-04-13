A = 'ABCDEFG'
for x,y in enumerate(A):
	print(x,y)


def dfs(vertex, G, used):
	"""
	Обход графа в глубину DFS
	G - списки связности
	"""
		
	used.add(vertex) #Добавляю себя раз уж меня позвали
	for neighbour in G[vertex]:
		if neighbour not in used:
			dfs(neighbour, G, used)
	
used = set()
N = 0 #Количество компонент связности
for vertex in G:
	if vertex not in used:
		dfs(vertex, G, used)
		N += 1
