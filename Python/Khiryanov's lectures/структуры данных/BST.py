class Node:
	
	def __init__(self, key, value):
		
		self.skew = 0
		self.h_r_tree = 0
		self.h_l_tree = 0
		
		self.key = key 
		self.value = value
		self.right = None
		self.left = None
		self.parent = None

class Tree:
	"""
	АВЛ - дерево
	>>> A = Tree()
	
	
	"""
	def __init__(self):
		self.root = None
		self.size = 0
	

	def small_left_rotation(self, tmp):
		"""
		у tmp.parent происходит переполнение значения skew
		"""
		#Переназначение ссылок
		top = tmp.parent.parent
		a = tmp.parent
		b = tmp
		
		if top is None:
			b.parent = top
			self.root = b
		elif top.right is a:
			b.parent = top
			top.right = b
		elif top.left is a:
			b.parent = top
			top.left = b
			
		a.parent = b
		a.right = b.left
		if b.left is not None:
			b.left.parent = a
		b.left = a
		
		#Перевычисление коэффициентов
		a.h_r_tree = b.h_l_tree
		b.h_l_tree = 1 + max(a.h_r_tree, a.h_l_tree)
		a.skew = a.h_r_tree - a.h_l_tree
		b.skew = b.h_r_tree - b.h_l_tree

	
	def big_left_rotation(self, tmp):
		"""
		у tmp.parent происходит переполнение значения skew
		"""
		#Переназначение ссылок
		top = tmp.parent.parent
		a = tmp.parent
		b = tmp
		c = tmp.left
		
		if top is None:
			c.parent = top
			self.root = с
		elif top.right is a:
			c.parent = top
			top.right = c
		elif top.left is a:
			c.parent = top
			top.left = c
			
		a.parent = c
		a.right = c.left
		if c.left is not None:
			c.left.parent = a
		b.parent = c
		b.left = c.right
		if c.right is not None:
			c.right.parent = b
		c.left = a
		c.right = b

		#Перевычисление коэффициентов
		a.h_r_tree = c.h_l_tree
		b.h_l_tree = c.h_r_tree
		c.h_l_tree = 1 + max(a.h_l_tree, a.h_r_tree)
		c.h_r_tree = 1 + max(b.h_l_tree, b.h_r_tree)
		a.skew = a.h_r_tree - a.h_l_tree
		b.skew = b.h_r_tree - b.h_l_tree
		c.skew = c.h_r_tree - c.h_l_tree
	
	
	def small_right_rotation(self, tmp):
		"""
		у tmp.parent происходит переполнение значения skew
		"""
		#Переназначение ссылок
		top = tmp.parent.parent
		a = tmp.parent
		b = tmp
		
		if top is None:
			b.parent = top
			self.root = b
		elif top.right is a:
			b.parent = top
			top.right = b
		elif top.left is a:
			b.parent = top
			top.left = b
			
		a.parent = b
		a.left = b.right
		if b.right is not None:
			b.right.parent = a
		b.right = a
		
		#Перевычисление коэффициентов
		a.h_l_tree = b.h_r_tree
		b.h_r_tree = 1 + max(a.h_l_tree, a.h_r_tree)
		a.skew = a.h_r_tree - a.h_l_tree
		b.skew = b.h_r_tree - b.h_l_tree
	

	def big_right_rotation(self, tmp):
		"""
		у tmp.parent происходит переполнение значения skew
		"""
		#Переназначение ссылок
		top = tmp.parent.parent
		a = tmp.parent
		b = tmp
		c = tmp.right
		
		if top is None:
			c.parent = top
			self.root = c
		elif top.right is a:
			c.parent = top
			top.right = c
		elif top.left is a:
			c.parent = top
			top.left = c
		
		a.parent = c
		a.left = c.right
		if c.right is not None:
			c.right.parent = a
		b.parent = c
		b.right = c.left
		if c.left is not None:
			c.left.parent = b
		c.right = a
		c.left = b
		
		#Перевычисление коэффициентов
		a.h_l_tree = c.h_r_tree
		b.h_r_tree = c.h_l_tree
		c.h_r_tree = 1 + max(a.h_l_tree, a.h_r_tree)
		c.h_l_tree = 1 + max(b.h_l_tree, b.h_r_tree)
		a.skew = a.h_r_tree - a.h_l_tree
		b.skew = b.h_r_tree - b.h_l_tree
		c.skew = c.h_r_tree - c.h_l_tree


	def count_skew_push(self, tmp):
		
		if tmp.parent is None:
			return
		elif tmp.parent.right is tmp:
			corrective = 1
		elif tmp.parent.left is tmp:
			corrective = -1	
		else:
			raise Warning("Сбой алгоритма, недопустимое место в программе")
		#допустимые значения для tmp.parent.skew -1, 0, 1
		if tmp.parent.skew + corrective == 2: #было 1 стало 2
			tmp.parent.h_r_tree += 1
			if tmp.parent.h_l_tree + 1 == max(tmp.h_r_tree, tmp.h_l_tree):
				#Условие для малого левого вращения
				if tmp.h_l_tree <= tmp.h_r_tree:
					self.small_left_rotation(tmp)
				#Условие для большого левого вращения
				elif tmp.h_l_tree > tmp.h_r_tree:
					self.big_left_rotation(tmp)
			else:
				raise Warning("Сбой алгоритма, недопустимое место в программе")
			return
		elif tmp.parent.skew + corrective == 1: #было 0 стало 1
			tmp.parent.skew += corrective
			tmp.parent.h_r_tree += 1
			tmp = tmp.parent
			self.count_skew_push(tmp)
			return
		elif tmp.parent.skew + corrective == 0: 
			tmp.parent.skew += corrective
			if tmp.parent.right is tmp:
				tmp.parent.h_r_tree += 1
			else:
				tmp.parent.h_l_tree += 1
			return
		elif tmp.parent.skew + corrective == -1: #было 0 стало -1
			tmp.parent.skew += corrective
			tmp.parent.h_l_tree += 1
			tmp = tmp.parent
			self.count_skew_push(tmp)
			return
		elif tmp.parent.skew + corrective == -2: #было -1 стало -2
			tmp.parent.h_l_tree += 1
			if tmp.parent.h_r_tree + 1 == max(tmp.h_r_tree, tmp.h_l_tree):
				#Условие для малого правого вращения
				if tmp.h_l_tree >= tmp.h_r_tree:
					self.small_right_rotation(tmp)
				#Условие для большого правого вращения
				elif tmp.h_l_tree < tmp.h_r_tree:
					self.big_right_rotation(tmp)
			else:
				raise Warning("Сбой алгоритма, недопустимое место в программе")
			return
		else:
			raise Warning("Сбой алгоритма, недопустимое место в программе")
	
	def push(self, key, value):
		if self.root is None:
			self.root = Node(key, value)
		else:
			x = Node(key, value)
			tmp = self.root
			while True:
				if x.key > tmp.key:
					if tmp.right is None:
						tmp.right = x
						x.parent = tmp
						tmp = x
						break
					else:
						tmp = tmp.right
				else:
					if tmp.left is None:
						tmp.left = x
						x.parent = tmp
						tmp = x
						break
					else:
						tmp = tmp.left
			self.count_skew_push(tmp)
		self.size += 1

	
	def find(self, key, from_the_inside=False):
		"""
		Если элемент есть в дереве:
		может вернуть ссылку на искомый элемент,
		если from_the_inside == True,
		иначе возвращает True
		"""
		if self.root is None:
			return False
		tmp = self.root
		while True:
			if key == tmp.key:
				if from_the_inside:
					return tmp
				else:
					return True
			elif key > tmp.key:
				if tmp.right is None:
					return False
				tmp = tmp.right
			else:
				if tmp.left is None:
					return False
				tmp = tmp.left


	def clear(self):
		self.root = None
		self.size = 0

	
	def find_min(self, tmp):
		"""
		tmp - ссылка на удаляемый элемент
		"""
		tmp = tmp.right
		while True:
			if tmp.left is None:
				return tmp
			tmp = tmp.left


	def delete(self, key):
		tmp = self.find(key, True)#Возвращает ссылку на искомый объект или False
		assert tmp is not False, "Такого элемента в дереве нету"
		self.size -= 1
		if tmp.right is None:#Нету правого поддерева
			if tmp.left is None:#Удаляемый элемент лист
				if tmp.parent is None:#Удалаемый элемент это корень size = 1
					self.clear()
					tmp = None#Для функции count_skew_delete
				else:#У удаляемого элемента есть родитель
					if tmp.parent.left is tmp:
						tmp.parent.left = None
					elif tmp.parent.right is tmp:
						tmp.parent.right = None
			else:#У удаляемого элемента есть левый потомок
				if tmp.parent is None:#Удалаемый элемент это корень size = 2
					tmp.left.parent = None
					self.root = tmp.left
					tmp = None#Для функции count_skew_delete
				else:#У удаляемого элемента есть родитель
					if tmp.parent.left is tmp:
						tmp.parent.left = tmp.left
					elif tmp.parent.right is tmp:
						tmp.parent.right = tmp.left
					tmp.left.parent = tmp.parent
		else:#У удаляемого элемента есть правое поддерево
			tmp_min = self.find_min(tmp)
			if tmp_min.parent is tmp:
				""" 
				приходим справа то есть -1 к skew, в tmp_min(после переназначений)
				"""
				if tmp.parent is None:#tmp это корень 
					tmp_min.parent = None
					self.root = tmp_min #СЮДА ДОБАВИТЬ!??!?!?!
				else:
					tmp_min.parent = tmp.parent
					if tmp.parent.right is tmp:
						tmp.parent.right = tmp_min
					elif tmp.parent.left is tmp:
						tmp.parent.left = tmp_min
					if tmp.left is not None:
						tmp_min.left = tmp.left
						tmp.left.parent = tmp_min
				""" --- """
			else:
				"""
				приходим слева то есть +1 к skew, в tmp_min.parent(до переназначений)
				"""
				if tmp.parent is None:#tmp это корень 
					tmp_min.parent = None
					self.root = tmp_min #СЮДА ДОБАВИТЬ!??!?!?!
				else:
					tmp_min.parent.left = tmp_min.right
					if tmp_min.right is not None:
						tmp_min.right.parent = tmp_min.parent
					tmp_min.parent = tmp.parent
					if tmp.parent.right is tmp:
						tmp.parent.right = tmp_min
					elif tmp.parent.left is tmp:
						tmp.parent.left = tmp_min
					tmp.right.parent = tmp_min
					tmp_min.right = tmp.right
					tmp.left.parent = tmp_min
					tmp_min.left = tmp.left
				""" --- """


	def count_skew_delete(self):




A = Tree()
A.push(1, 'o')
A.push(2, 'o')
A.push(3, 'o')
A.push(4, 'o')
A.push(5, 'o')
A.push(6, 'o')
A.push(6, 'o')
A.push(3.25, 'o')
A.push(2.5, 'o')
A.push(0.5, 'o')
A.push(3.5, 'o')
print(A.root.key)
print(A.root.left.key)





if __name__ == "__main__":
	import doctest
	doctest.testmod()		
