def hanoy_towers(n, i, tmp, k):
	""" Алгоритм Ханойскиx башен """
	if n == 1:
		k.append(i.pop())
		return
	hanoy_towers(n-1, i, k, tmp)
	k.append(i.pop())
	hanoy_towers(n-1, tmp, i, k)
	
i, tmp, k = [5,4,3,2,1], [], []
n = len(i)
print(k,i,sep='\n',end='\n\n')

hanoy_towers(n, i, tmp, k)

print(k,i,sep='\n')
