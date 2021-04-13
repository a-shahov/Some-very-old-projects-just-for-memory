class GameStats():
	
	def __init__(self, ai_settings):
		
		self.ai_settings = ai_settings
		self.reset_stats()
		self.game_active = False
		
		self.load_stats()
		
	def reset_stats(self):
		
		self.ships_left = self.ai_settings.ship_limit
		self.score = 0
		self.level = 1
	
	def load_stats(self):
		"""Загружает данные о рекорде"""
		try:
			file_stats = open('record.txt', 'r')
			self.high_score = int(file_stats.read())
			file_stats.close()
			
		except FileNotFoundError:
			self.high_score = 0
	
	def save_stats(self):
		"""Сохраняет данные рекорда в файл"""
		file_stats = open('record.txt', 'w')
		file_stats.write(str(self.high_score))
		file_stats.close()
