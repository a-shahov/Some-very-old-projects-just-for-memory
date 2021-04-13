d1 = {1:2, 2:2, 3:2}
d2 = {4:2, 5:2, 6:2}
d1 = d2 
print(d1)


def func1(*S):
	for x in S:
		print(x)

spy = [1,'fffuck', 33, 22]
cry = [12,'hell', 323, 212]
func1(spy, cry)

def func1_1(*M):
	return M

def func2(*K):
	for x in range(0,1):
		K = func1_1(K)
	print(K)

func2(1,2,3)
