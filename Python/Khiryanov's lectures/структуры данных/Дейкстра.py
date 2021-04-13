from collections import deque


def main():
	G = read_graph()
	start = input("Begin: ")
	while start not in G:
		start = input("Такой вершины нету. Begin: ")
	shortest_distances = dijkstra(G, start)
	finish = input("Finish: ")
	while finish not in G:
		finish = input("Такой вершины нету. Finish: ")	
	
	# Надо дописать
	shortest_path = reveal_shortest_path(G, start, finish,
											shortest_distances)
	
	
def read_graph():
	M = int(input()) #Число рёбер
	G = {}
	for i in range(M):
		a, b, weight = input().split()
		weight = float(weight)
		add_edge(G, a, b, weight)
		add_edge(G, b, a, weight)


def add_edge(G, a, b, weight):
	if a not in G:
		G[a] = {b: weight}
	else:
		G[a][b] = weight


def dijkstra(G, start):
	Q = deque()
	S = {}
	S[start] = 0
	Q.push(start)
	while Q:
		v = Q.pop()
		for u in G[v]:
			if u not in S or S[v] + G[v][u] < S[u]:
				S[u] = S[v] + G[v][u]
				Q.push(u)
				
	return S

if __name__ == "__main__":
	main()
