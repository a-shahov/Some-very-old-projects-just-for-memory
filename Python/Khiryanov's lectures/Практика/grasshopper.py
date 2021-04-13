def jump_count1(n):
	"+1 +2 +3"
	count_list = [None for i in range(n)]
	count_list[0] = 0
	count_list[1] = 1
	count_list[2] = 2
	count_list[3] = 4
	
	for i in range(4, n):
		count_list[i] = count_list[i-1] + count_list[i-2] + count_list[i-3]
	
	return count_list[-1]


def jump_count(jumping, n):
	"+jumping[0] ... +jumping[-1]"
	jumping.sort()
	count_list = [0 for i in range(n)]
	count_list[0] = 0
	
	for jump in jumping:
		count_list[jump] = 1

	for i in range(1, n):
		for jump in jumping:
			if i - jump > 0:
				count_list[i] += count_list[i-jump]
			
	return count_list


print(jump_count([3,1,2], 4))
