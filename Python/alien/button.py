import pygame.font

class Button():
	
	def __init__(self, ai_settings, screen, msg):
		
		self.screen = screen
		self.screen_rect = self.screen.get_rect()
		self.width, self.height = 200, 50
		self.button_color = (0, 255, 0)
		self.text_color = (255, 255, 255)
		self.font = pygame.font.SysFont(None, 48)
		#Координаты ширина и высота
		self.rect = pygame.Rect(0, 0, self.width, self.height)
		self.rect.center = self.screen_rect.center
		
		self.prep_msg(msg)
	
	def prep_msg(self, msg):
		
		#Преобразует текст в изображение
		#Логическая переменная отвечает за сглаживание 
		self.msg_image = self.font.render(msg, True, self.text_color,
			self.button_color)
		self.msg_image_rect = self.msg_image.get_rect()
		self.msg_image_rect.center = self.rect.center
		
	def draw_button(self):
		
		#рисует прямоугольную часть кнопки
		self.screen.fill(self.button_color, self.rect)
		#выводит изображение текста
		self.screen.blit(self.msg_image, self.msg_image_rect)
