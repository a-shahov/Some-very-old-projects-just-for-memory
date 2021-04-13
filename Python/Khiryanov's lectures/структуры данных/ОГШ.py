from collections import deque

def WGW(N, M):
	"""
	обход графа в ширину
	"""
	graph = {i: set() for i in range(N)}
	for i in range(M):
		v1, v2 = map(int, input().split())
		for v,u in (v1, v2), (v2, v1):
			graph[v].add(u)
			
	distances =	[None]*N
	distances[start_vertex] = 0
	start_vertex = 0
	queue = deque([start_vertex])
	
	while queue:
		cur_v = queue.popleft()
		for neighbour in graph[cur_v]:
			if distances[neighbour] is None:
				distances[neighbour] = distances[cur_v] + 1
				queue.append(neighbour)
				
				
