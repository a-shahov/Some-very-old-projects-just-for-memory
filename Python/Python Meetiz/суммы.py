import random

massive1 = []
massive2 = []

for x in range(1,11):
	massive1.append(random.randint(1,101))
	massive2.append(random.randint(1,101))

print(massive1)
print(massive2)
print('Максимальный элемент в первом массиве '+ str(max(massive1)))
print('Максимальный элемент во втором массиве '+ str(max(massive2)))
print('Сумма элементов в первом массиве '+str(sum(massive1)))
print('Сумма элементов во втором массиве '+str(sum(massive2)))
